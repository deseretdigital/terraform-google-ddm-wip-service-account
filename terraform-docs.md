## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 6.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 6.8.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_iam_workload_identity_pool.pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workload_identity_pool) | resource |
| [google_iam_workload_identity_pool_provider.oidc_provider](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workload_identity_pool_provider) | resource |
| [google_project_iam_member.project](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_service_account.service_account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_service_account_iam_member.workload_identity_pool_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_iam_member) | resource |
| [random_pet.service_account_random_name](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_iam_role_ids"></a> [iam\_role\_ids](#input\_iam\_role\_ids) | List of Role ID's that will be added to the service account. | `list(string)` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | The project the service account will be created in. | `string` | n/a | yes |
| <a name="input_repository_name"></a> [repository\_name](#input\_repository\_name) | The name of the repository. | `string` | n/a | yes |
| <a name="input_repository_owner"></a> [repository\_owner](#input\_repository\_owner) | The owner of the repository for claim validation. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_wif_provider"></a> [wif\_provider](#output\_wif\_provider) | The full provider path for the Workload Identity Pool. |
| <a name="output_wif_service_account"></a> [wif\_service\_account](#output\_wif\_service\_account) | The email of the Google Cloud Service Account. |