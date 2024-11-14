Module to create an GKE cluster (standard or autopilot) where to deploy a Vault cluster. It extends helm capabilities by adding a loadbalancer for KMIP

## Requirements

| Name                                | Version |
| ----------------------------------- | ------- |
| [acme](#requirement\_acme)             | 2.26.0  |
| [google](#requirement\_google)         | 6.3.0   |
| [helm](#requirement\_helm)             | 2.15.0  |
| [kubernetes](#requirement\_kubernetes) | 2.32.0  |
| [null](#requirement\_null)             | 3.2.3   |
| [random](#requirement\_random)         | 3.6.3   |
| [time](#requirement\_time)             | 0.12.1  |
| [tls](#requirement\_tls)               | 4.0.6   |

## Providers

| Name                             | Version |
| -------------------------------- | ------- |
| [acme](#provider\_acme)             | 2.26.0  |
| [google](#provider\_google)         | 6.3.0   |
| [helm](#provider\_helm)             | 2.15.0  |
| [kubernetes](#provider\_kubernetes) | 2.32.0  |
| [random](#provider\_random)         | 3.6.3   |
| [time](#provider\_time)             | 0.12.1  |
| [tls](#provider\_tls)               | 4.0.6   |

## Modules

No modules.

## Resources

| Name                                                                                                                                                   | Type        |
| ------------------------------------------------------------------------------------------------------------------------------------------------------ | ----------- |
| [acme_certificate.certificate](https://registry.terraform.io/providers/vancluever/acme/2.26.0/docs/resources/certificate)                                 | resource    |
| [acme_registration.registration](https://registry.terraform.io/providers/vancluever/acme/2.26.0/docs/resources/registration)                              | resource    |
| [google_compute_network.global_vpc](https://registry.terraform.io/providers/hashicorp/google/6.3.0/docs/resources/compute_network)                        | resource    |
| [google_compute_router.custom_router](https://registry.terraform.io/providers/hashicorp/google/6.3.0/docs/resources/compute_router)                       | resource    |
| [google_compute_router_nat.custom_nat](https://registry.terraform.io/providers/hashicorp/google/6.3.0/docs/resources/compute_router_nat)                  | resource    |
| [google_compute_subnetwork.proxy_only_subnet](https://registry.terraform.io/providers/hashicorp/google/6.3.0/docs/resources/compute_subnetwork)           | resource    |
| [google_compute_subnetwork.subnet1](https://registry.terraform.io/providers/hashicorp/google/6.3.0/docs/resources/compute_subnetwork)                     | resource    |
| [google_container_cluster.default](https://registry.terraform.io/providers/hashicorp/google/6.3.0/docs/resources/container_cluster)                       | resource    |
| [google_container_node_pool.primary_preemptible_nodes](https://registry.terraform.io/providers/hashicorp/google/6.3.0/docs/resources/container_node_pool) | resource    |
| [google_dns_record_set.vip](https://registry.terraform.io/providers/hashicorp/google/6.3.0/docs/resources/dns_record_set)                                 | resource    |
| [google_dns_record_set.vip_cluster_port](https://registry.terraform.io/providers/hashicorp/google/6.3.0/docs/resources/dns_record_set)                    | resource    |
| [google_dns_record_set.vip_kmip](https://registry.terraform.io/providers/hashicorp/google/6.3.0/docs/resources/dns_record_set)                            | resource    |
| [google_kms_crypto_key.vault_key](https://registry.terraform.io/providers/hashicorp/google/6.3.0/docs/resources/kms_crypto_key)                           | resource    |
| [google_kms_key_ring.key_ring](https://registry.terraform.io/providers/hashicorp/google/6.3.0/docs/resources/kms_key_ring)                                | resource    |
| [google_project_iam_custom_role.kms_role](https://registry.terraform.io/providers/hashicorp/google/6.3.0/docs/resources/project_iam_custom_role)          | resource    |
| [google_project_iam_member.vault_kms](https://registry.terraform.io/providers/hashicorp/google/6.3.0/docs/resources/project_iam_member)                   | resource    |
| [google_project_iam_member.workload_identity-role](https://registry.terraform.io/providers/hashicorp/google/6.3.0/docs/resources/project_iam_member)      | resource    |
| [google_project_service.cloudkms](https://registry.terraform.io/providers/hashicorp/google/6.3.0/docs/resources/project_service)                          | resource    |
| [google_service_account.default](https://registry.terraform.io/providers/hashicorp/google/6.3.0/docs/resources/service_account)                           | resource    |
| [google_service_account.service_account](https://registry.terraform.io/providers/hashicorp/google/6.3.0/docs/resources/service_account)                   | resource    |
| [google_storage_bucket.vault_license_bucket](https://registry.terraform.io/providers/hashicorp/google/6.3.0/docs/resources/storage_bucket)                | resource    |
| [google_storage_bucket_iam_member.member_object](https://registry.terraform.io/providers/hashicorp/google/6.3.0/docs/resources/storage_bucket_iam_member) | resource    |
| [helm_release.vault_community](https://registry.terraform.io/providers/hashicorp/helm/2.15.0/docs/resources/release)                                      | resource    |
| [helm_release.vault_enterprise](https://registry.terraform.io/providers/hashicorp/helm/2.15.0/docs/resources/release)                                     | resource    |
| [kubernetes_config_map.log-rotate](https://registry.terraform.io/providers/hashicorp/kubernetes/2.32.0/docs/resources/config_map)                         | resource    |
| [kubernetes_namespace.vault](https://registry.terraform.io/providers/hashicorp/kubernetes/2.32.0/docs/resources/namespace)                                | resource    |
| [kubernetes_secret.license_secret](https://registry.terraform.io/providers/hashicorp/kubernetes/2.32.0/docs/resources/secret)                             | resource    |
| [kubernetes_secret.tls_secret](https://registry.terraform.io/providers/hashicorp/kubernetes/2.32.0/docs/resources/secret)                                 | resource    |
| [kubernetes_service.kmip](https://registry.terraform.io/providers/hashicorp/kubernetes/2.32.0/docs/resources/service)                                     | resource    |
| [random_string.vault](https://registry.terraform.io/providers/hashicorp/random/3.6.3/docs/resources/string)                                               | resource    |
| [time_sleep.wait_60_seconds](https://registry.terraform.io/providers/hashicorp/time/0.12.1/docs/resources/sleep)                                          | resource    |
| [tls_private_key.ca](https://registry.terraform.io/providers/hashicorp/tls/4.0.6/docs/resources/private_key)                                              | resource    |
| [tls_private_key.private_key](https://registry.terraform.io/providers/hashicorp/tls/4.0.6/docs/resources/private_key)                                     | resource    |
| [google_client_config.default](https://registry.terraform.io/providers/hashicorp/google/6.3.0/docs/data-sources/client_config)                            | data source |
| [google_compute_network.network](https://registry.terraform.io/providers/hashicorp/google/6.3.0/docs/data-sources/compute_network)                        | data source |
| [google_dns_managed_zone.env_dns_zone](https://registry.terraform.io/providers/hashicorp/google/6.3.0/docs/data-sources/dns_managed_zone)                 | data source |
| [kubernetes_service.vault_lb_5696](https://registry.terraform.io/providers/hashicorp/kubernetes/2.32.0/docs/data-sources/service)                         | data source |
| [kubernetes_service.vault_lb_8200](https://registry.terraform.io/providers/hashicorp/kubernetes/2.32.0/docs/data-sources/service)                         | data source |
| [kubernetes_service.vault_lb_8201](https://registry.terraform.io/providers/hashicorp/kubernetes/2.32.0/docs/data-sources/service)                         | data source |

## Inputs

| Name                                                  | Description                                                                                                                         | Type       | Default            | Required |
| ----------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- | ---------- | ------------------ | :------: |
| [acme\_prod](#input\_acme\_prod)                         | Whether to use ACME prod url or staging one. The staging certificate will not be trusted by default                                 | `bool`   | `false`          |    no    |
| [cluster-name](#input\_cluster-name)                     | Prefix to identify the vault cluster. This name will be used in the public DNS names and certificate                                | `string` | n/a                |   yes   |
| [create\_network](#input\_create\_network)               | Whether to use an existing VPC and Subnets or create them                                                                           | `bool`   | `true`           |    no    |
| [create\_vpc](#input\_create\_vpc)                       | Whether to create a VPC                                                                                                             | `bool`   | `true`           |    no    |
| [dns\_zone\_name\_ext](#input\_dns\_zone\_name\_ext)     | Name of the External DNS Zone that must be precreated in your project.<br />This will help in creating your public Certs using ACME | `string` | n/a                |   yes   |
| [email](#input\_email)                                   | Email address to create Certs in ACME request                                                                                       | `string` | n/a                |   yes   |
| [expose](#input\_expose)                                 | Whether to make Vault LB Internal or External                                                                                       | `string` | n/a                |   yes   |
| [gke\_autopilot\_enable](#input\_gke\_autopilot\_enable) | Whether to enable or not GKE Autopilot                                                                                              | `bool`   | `false`          |    no    |
| [k8s\_namespace](#input\_k8s\_namespace)                 | K8S namespace where to install Vault                                                                                                | `string` | `"vault"`        |    no    |
| [kmip\_enable](#input\_kmip\_enable)                     | Enable kmip loadbalancer. Requires Vault Enterprise                                                                                 | `bool`   | `false`          |    no    |
| [location](#input\_location)                             | n/a                                                                                                                                 | `string` | `"global"`       |    no    |
| [machine\_type](#input\_machine\_type)                   | Machine type                                                                                                                        | `string` | `"e2-medium"`    |    no    |
| [node\_count](#input\_node\_count)                       | Number of Vault instances. Typically 3 or 5                                                                                         | `number` | `3`              |    no    |
| [project\_id](#input\_project\_id)                       | You GCP project ID                                                                                                                  | `string` | n/a                |   yes   |
| [region](#input\_region)                                 | n/a                                                                                                                                 | `string` | `"europe-west1"` |    no    |
| [storage\_location](#input\_storage\_location)           | The Geo to store the snapshots                                                                                                      | `string` | `"EU"`           |    no    |
| [subnet1-region](#input\_subnet1-region)                 | Subnet to deploy VMs and VIPs                                                                                                       | `string` | `"10.0.1.0/24"`  |    no    |
| [subnet2-region](#input\_subnet2-region)                 | proxy-only subnet for EXTERNAL LOAD BALANCER                                                                                        | `string` | `"10.0.2.0/24"`  |    no    |
| [subnet\_reference](#input\_subnet\_reference)           | id or self\_link of subnet that will be used to host the EKS cluster                                                                | `string` | `""`             |    no    |
| [vault\_enterprise](#input\_vault\_enterprise)           | Whether using Vault Enterprise or not                                                                                               | `bool`   | `true`           |    no    |
| [vault\_helm\_release](#input\_vault\_helm\_release)     | Helm release for Vault                                                                                                              | `string` | `"0.28.1"`       |    no    |
| [vault\_license](#input\_vault\_license)                 | Vault Enterprise License as string                                                                                                  | `string` | `"empty"`        |    no    |
| [vault\_version](#input\_vault\_version)                 | Vault version expressed as X{n}.X{1,n}.X{1,n}, for example 1.16.3                                                                   | `string` | n/a                |   yes   |
| [vpc\_name](#input\_vpc\_name)                           | Name of VPC to be created.<br />The actual number will be randomize with a random suffix                                            | `string` | n/a                |   yes   |
| [vpc\_reference](#input\_vpc\_reference)                 | id or self\_link of vpc that will be used to host the EKS cluster.                                                                  | `string` | `""`             |    no    |
| [with\_node\_pool](#input\_with\_node\_pool)             | Whether to use node pools. It does not apply when autopilot is used                                                                 | `bool`   | `false`          |    no    |

## Outputs

| Name                                                         | Description                                                                        |
| ------------------------------------------------------------ | ---------------------------------------------------------------------------------- |
| [configure\_kubectl](#output\_configure\_kubectl)               | gcloud command to configure your kubeconfig once the cluster has been created      |
| [fqdn\_8200](#output\_fqdn\_8200)                               | FQDN for API and UI                                                                |
| [fqdn\_8201](#output\_fqdn\_8201)                               | FQDN for Cluster PORT pointing to Vault leader                                     |
| [fqdn\_kmip](#output\_fqdn\_kmip)                               | FQDN for KMIP PORT when enabled                                                    |
| [helm](#output\_helm)                                           | Helm values used to install vault                                                  |
| [init\_remote](#output\_init\_remote)                           | Steps to initialize Vault from your terminal                                       |
| [kubernetes\_cluster](#output\_kubernetes\_cluster)             | Details to connect to K8S cluster: Host, token and CA                              |
| [kubernetes\_cluster\_host](#output\_kubernetes\_cluster\_host) | GKE Cluster Host                                                                   |
| [kubernetes\_cluster\_name](#output\_kubernetes\_cluster\_name) | GKE Cluster Name                                                                   |
| [project\_id](#output\_project\_id)                             | GCloud Project ID                                                                  |
| [read\_vault\_token](#output\_read\_vault\_token)               | Gcloud command to read Vault root token, saved as secret during the initialization |
