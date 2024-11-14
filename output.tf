output "project_id" {
  value       = var.project_id
  description = "GCloud Project ID"
}

output "kubernetes_cluster_name" {
  value       = google_container_cluster.default.name
  description = "GKE Cluster Name"
}

output "kubernetes_cluster_host" {
  value       = google_container_cluster.default.endpoint
  description = "GKE Cluster Host"
}

output "configure_kubectl" {
  description = "gcloud command to configure your kubeconfig once the cluster has been created"
  value = "gcloud container clusters get-credentials ${google_container_cluster.default.name} --region ${var.region} --project ${var.project_id}"
}

locals {
  fqdn_ext8200 = var.expose == "External" ? substr(google_dns_record_set.vip[0].name, 0, length(google_dns_record_set.vip[0].name) - 1) : " "
  fqdn_ext8201 = var.expose == "External" ? substr(google_dns_record_set.vip_cluster_port[0].name, 0, length(google_dns_record_set.vip_cluster_port[0].name) - 1) : " "
  fqdn_ext5696 = (var.kmip_enable && var.vault_enterprise && var.expose == "External" ) ? substr(google_dns_record_set.vip_kmip[0].name, 0, length(google_dns_record_set.vip_kmip[0].name) - 1) : " " 
}

output "fqdn_8200" {
  description = "FQDN for API and UI"
  value = "https://${local.fqdn_ext8200}:8200"
}

output "fqdn_8201" {
  description = "FQDN for Cluster PORT pointing to Vault leader"
  value = "https://${local.fqdn_ext8201}:8201"
}

output "fqdn_kmip" {
  description = "FQDN for KMIP PORT when enabled"
  value      = "https://${local.fqdn_ext5696}:5696"
}

locals {
  helm = var.vault_enterprise ? helm_release.vault_enterprise[0].values : helm_release.vault_community[0].values
}

output "helm" {
  description = "Helm values used to install vault"
  value = local.helm

}


locals {
  init_remote_ent = <<EOF
# ---------------------------
# ===========================
# Initialize Vault
export VAULT_ADDR=https://${local.fqdn_ext8200}:8200
export VAULT_SKIP_VERIFY=true
vault status
curl -k $VAULT_ADDR

vault operator init -format=json > output.json
cat output.json | jq -r .root_token > root.token
export VAULT_TOKEN=$(cat root.token)
sleep 10

# Save info in GCP Secrets
gcloud secrets create root_token_${var.region}_${random_string.vault.result} --replication-policy="automatic" --project=${var.project_id}
echo -n $VAULT_TOKEN | gcloud secrets versions add root_token_${var.region}_${random_string.vault.result} --project=${var.project_id} --data-file=-
gcloud secrets create vault_init_data_${var.region}_${random_string.vault.result} --replication-policy="automatic" --project=${var.project_id}
cat output.json | gcloud secrets versions add vault_init_data_${var.region}_${random_string.vault.result} --project=${var.project_id} --data-file=-
rm output.json
rm root.token

# Enable Audit Logging
vault audit enable file file_path=/vault/audit/vault.log -path=localfile/
vault audit enable -path=stdout file file_path=stdout

# Enable Dead Server clean-up, min-quorum should be set in accordance to cluster size
vault operator raft autopilot set-config -cleanup-dead-servers=true -dead-server-last-contact-threshold=1m -min-quorum=3

# Enable automatic snapshot
gcloud iam service-accounts keys create sa-keys__${var.region}_${random_string.vault.result}.json --iam-account=${google_service_account.service_account.email}
vault write sys/storage/raft/snapshot-auto/config/hourly interval="1h" retain=10 path_prefix="snapshots/" storage_type=google-gcs google_gcs_bucket=${google_storage_bucket.vault_license_bucket.name} google_service_account_key="@sa-keys__${var.region}_${random_string.vault.result}.json"
rm sa-keys__${var.region}_${random_string.vault.result}.json
# ===========================
# ---------------------------
  EOF

init_remote_ce = <<EOF
# ---------------------------
# ===========================
# Initialize Vault
export VAULT_ADDR=https://${local.fqdn_ext8200}:8200
export VAULT_SKIP_VERIFY=true
vault status
curl -k $VAULT_ADDR

vault operator init -format=json > output.json
cat output.json | jq -r .root_token > root.token
export VAULT_TOKEN=$(cat root.token)
sleep 10

# Save info in GCP Secrets
gcloud secrets create root_token_${var.region}_${random_string.vault.result} --replication-policy="automatic" --project=${var.project_id}
echo -n $VAULT_TOKEN | gcloud secrets versions add root_token_${var.region}_${random_string.vault.result} --project=${var.project_id} --data-file=-
gcloud secrets create vault_init_data_${var.region}_${random_string.vault.result} --replication-policy="automatic" --project=${var.project_id}
cat output.json | gcloud secrets versions add vault_init_data_${var.region}_${random_string.vault.result} --project=${var.project_id} --data-file=-
rm output.json
rm root.token

# Enable Audit Logging
vault audit enable file file_path=/vault/audit/vault.log -path=localfile/
vault audit enable -path=stdout file file_path=stdout
# ===========================
# ---------------------------
  EOF

init_remote = (var.vault_enterprise) ? local.init_remote_ent: local.init_remote_ce
}

output "init_remote" {
  description = "Steps to initialize Vault from your terminal"
  value = local.init_remote
}

output "read_vault_token" {
  description = "gcloud command to read Vault root token, saved as secret during the initialization"
  value = "gcloud secrets versions access latest --secret=root_token_${var.region}_${random_string.vault.result} --project=${var.project_id}"
}


locals {
  kubernetes_cluster = {
      host  = "https://${google_container_cluster.default.endpoint}"
      token = data.google_client_config.default.access_token
      cluster_ca_certificate = base64decode(google_container_cluster.default.master_auth[0].cluster_ca_certificate)
  }
}

output "kubernetes_cluster" {
  description = "Details to connect to K8S cluster: Host, token and CA"
  value = local.kubernetes_cluster
}