## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15.2 |
| <a name="requirement_google"></a> [google](#requirement\_google) | 3.86.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 3.86.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_firewall.threat-mapper-access](https://registry.terraform.io/providers/hashicorp/google/3.86.0/docs/resources/compute_firewall) | resource |
| [google_compute_firewall.threat-mapper-iap](https://registry.terraform.io/providers/hashicorp/google/3.86.0/docs/resources/compute_firewall) | resource |
| [google_compute_instance.threat-mapper](https://registry.terraform.io/providers/hashicorp/google/3.86.0/docs/resources/compute_instance) | resource |
| [google_compute_network.threat_mapper_vpc](https://registry.terraform.io/providers/hashicorp/google/3.86.0/docs/resources/compute_network) | resource |
| [google_compute_subnetwork.threat_mapper_subnetwork](https://registry.terraform.io/providers/hashicorp/google/3.86.0/docs/resources/compute_subnetwork) | resource |
| [google_project_iam_member.threat-mapper_account_logs](https://registry.terraform.io/providers/hashicorp/google/3.86.0/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.threat-mapper_account_metrics](https://registry.terraform.io/providers/hashicorp/google/3.86.0/docs/resources/project_iam_member) | resource |
| [google_service_account.threat-mapper](https://registry.terraform.io/providers/hashicorp/google/3.86.0/docs/resources/service_account) | resource |
| [random_string.deployment-id](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | Name for the VPC network | `any` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Google Cloud project name | `any` | n/a | yes |
| <a name="input_subnet_region"></a> [subnet\_region](#input\_subnet\_region) | Region for the subnet where ThreatMapper will be deployed | `any` | n/a | yes |
| <a name="input_whitelisted_ips"></a> [whitelisted\_ips](#input\_whitelisted\_ips) | IPs allowed to connect to the management plane | `list` | `[]` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | Zone for the ThreatMapper control node, must be in the subnet\_region | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ssh"></a> [ssh](#output\_ssh) | ssh connection via IAP |
| <a name="output_webui"></a> [webui](#output\_webui) | URL of the webUI |
