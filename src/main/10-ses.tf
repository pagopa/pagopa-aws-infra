module "ses" {
  source     = "github.com/pagopa/terraform-aws-ses.git?ref=v1.1.0"
  domain     = "pagopa.gov.it"
  mail_from_subdomain = "email"
  aws_region = var.aws_region

  iam_permissions = [
    "ses:SendCustomVerificationEmail",
    "ses:SendEmail",
    "ses:SendRawEmail",
    "ses:SendTemplatedEmail"
  ]

  ses_group_name = "pagoPaSES"
  user_name      = "ProjectPagoPa"

  iam_allowed_resources = [format("arn:aws:ses:%s:%s:identity/*", var.aws_region, data.aws_caller_identity.current.id)]

  iam_additional_statements = [
    {
      sid       = "Statistics"
      actions   = ["ses:GetSendQuota"]
      resources = ["*"]
    }
  ]

}