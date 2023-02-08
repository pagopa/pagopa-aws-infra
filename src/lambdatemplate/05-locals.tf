locals {
  account_id                = data.aws_caller_identity.current.account_id
  project                   = format("%s-%s-%s", var.prefix, var.env_short, var.app_name)
  ecr_url                   = format("%s.dkr.ecr.%s.amazonaws.com", local.account_id, var.aws_region)
  ecr_repository_name       = format("%s%s%s", var.prefix, var.env_short, var.app_name)
  ecr_repository_url        = format("%s/%s", local.ecr_url, local.ecr_repository_name)
  ecr_image_tag             = "latest"
  lambda_invocation_auth    = "NONE"
}