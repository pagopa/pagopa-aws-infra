## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.2.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.22.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.22.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ses_pagopa_gov_it"></a> [ses\_pagopa\_gov\_it](#module\_ses\_pagopa\_gov\_it) | github.com/pagopa/terraform-aws-ses.git?ref=v1.2.0 |  |
| <a name="module_ses_pagopa_it"></a> [ses\_pagopa\_it](#module\_ses\_pagopa\_it) | github.com/pagopa/terraform-aws-ses.git?ref=v1.2.0 |  |

## Resources

| Name | Type |
|------|------|
| [aws_sns_topic.alarms](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic_subscription.alarms_email](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |
| [aws_sns_topic_subscription.alarms_slack](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_secretsmanager_secret.email_operation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret) | data source |
| [aws_secretsmanager_secret_version.email_operation_lt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret_version) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | App name. Personal Data Vault | `string` | `"pagopa"` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region to create resources. Default Milan | `string` | `"eu-south-1"` | no |
| <a name="input_azs"></a> [azs](#input\_azs) | Availability zones | `list(string)` | <pre>[<br>  "eu-south-1a",<br>  "eu-south-1b",<br>  "eu-south-1c"<br>]</pre> | no |
| <a name="input_env_short"></a> [env\_short](#input\_env\_short) | Evnironment short. | `string` | `"d"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment | `string` | `"dev"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(any)` | <pre>{<br>  "CreatedBy": "Terraform"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ses_pagopa_gov_it_dkim_tokens"></a> [ses\_pagopa\_gov\_it\_dkim\_tokens](#output\_ses\_pagopa\_gov\_it\_dkim\_tokens) | n/a |
| <a name="output_ses_pagopa_gov_it_user_access_key_id"></a> [ses\_pagopa\_gov\_it\_user\_access\_key\_id](#output\_ses\_pagopa\_gov\_it\_user\_access\_key\_id) | n/a |
| <a name="output_ses_pagopa_gov_it_user_secret_access_key"></a> [ses\_pagopa\_gov\_it\_user\_secret\_access\_key](#output\_ses\_pagopa\_gov\_it\_user\_secret\_access\_key) | n/a |
| <a name="output_ses_pagopa_gov_it_verification_token"></a> [ses\_pagopa\_gov\_it\_verification\_token](#output\_ses\_pagopa\_gov\_it\_verification\_token) | n/a |
| <a name="output_ses_pagopa_it_dkim_tokens"></a> [ses\_pagopa\_it\_dkim\_tokens](#output\_ses\_pagopa\_it\_dkim\_tokens) | n/a |
| <a name="output_ses_pagopa_it_user_access_key_id"></a> [ses\_pagopa\_it\_user\_access\_key\_id](#output\_ses\_pagopa\_it\_user\_access\_key\_id) | n/a |
| <a name="output_ses_pagopa_it_user_secret_access_key"></a> [ses\_pagopa\_it\_user\_secret\_access\_key](#output\_ses\_pagopa\_it\_user\_secret\_access\_key) | n/a |
| <a name="output_ses_pagopa_it_verification_token"></a> [ses\_pagopa\_it\_verification\_token](#output\_ses\_pagopa\_it\_verification\_token) | n/a |
