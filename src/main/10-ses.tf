module "ses" {
  source     = "github.com/pagopa/terraform-aws-ses.git?ref=v1.0.2"
  domain     = "pagopa.gov.it"
  aws_region = var.aws_region

  iam_permissions = [
    "ses:SendCustomVerificationEmail",
    "ses:SendEmail",
    "ses:SendRawEmail",
    "ses:SendTemplatedEmail",
  ]

  ses_group_name = "pagoPaSES"
  user_name      = "ProjectPagoPa"

  iam_allowed_resources = [format("arn:aws:ses:%s:%s:identity/*", var.aws_region, data.aws_caller_identity.current.id)]

}