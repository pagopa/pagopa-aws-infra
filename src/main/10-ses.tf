module "ses_pagopa_gov_it" {
  source              = "github.com/pagopa/terraform-aws-ses.git?ref=v1.2.0"
  domain              = "pagopa.gov.it"
  mail_from_subdomain = "email"
  aws_region          = var.aws_region

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

  alarms = {
    actions                    = [aws_sns_topic.alarms.arn]
    daily_send_quota_threshold = 40000
    daily_send_quota_period    = 60 * 60 * 24 # 1 day

    reputation_complaint_rate_threshold = 0.8
    reputation_complaint_rate_period    = 60 * 60 # 1 hour.

    reputation_bounce_rate_threshold = 0.1
    reputation_bounce_rate_period    = 5 * 60 # 5min
  }
}


module "ses_pagopa_it" {
  source              = "github.com/pagopa/terraform-aws-ses.git?ref=v1.2.0"
  domain              = "pagopa.it"
  mail_from_subdomain = "email"
  aws_region          = var.aws_region

  iam_permissions = [
    "ses:SendCustomVerificationEmail",
    "ses:SendEmail",
    "ses:SendRawEmail",
    "ses:SendTemplatedEmail"
  ]

  ses_group_name = "NotificationService"
  user_name      = "notification-service"

  iam_allowed_resources = [format("arn:aws:ses:%s:%s:identity/*", var.aws_region, data.aws_caller_identity.current.id)]

  iam_additional_statements = [
    {
      sid       = "Statistics"
      actions   = ["ses:GetSendQuota"]
      resources = ["*"]
    }
  ]
}