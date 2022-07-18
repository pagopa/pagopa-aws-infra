module "ses" {
  source = "git::https://github.com/pagopa/terraform-aws-ses.git?ref=v1.0.0"
  domain = "pagopa.gov.it"

  iam_permissions = [
    "ses:SendCustomVerificationEmail",
    "ses:SendEmail",
    "ses:SendRawEmail",
    "ses:SendTemplatedEmail",
  ]

  ses_group_name = "pagoPaSES"
  user_name      = "ProjectPagoPa"

}