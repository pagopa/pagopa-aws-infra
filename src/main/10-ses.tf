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


module "ses_ricevute_pagopa_it" {
  source              = "github.com/pagopa/terraform-aws-ses.git?ref=v1.2.0"
  domain              = "ricevute.pagopa.it"
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

  iam_additional_statements = [
    {
      sid       = "Statistics"
      actions   = ["ses:GetSendQuota"]
      resources = ["*"]
    }
  ]
}


# https://docs.aws.amazon.com/general/latest/gr/ses.html
module "ses_platform_pagopa_it" {
  source              = "github.com/pagopa/terraform-aws-ses.git?ref=v1.2.0"

  providers = {
    aws = aws.eu-central-1
  }

  domain              = "platform.pagopa.it"
  mail_from_subdomain = "email"
  aws_region          = "eu-central-1" //var.aws_region # https://docs.aws.amazon.com/ses/latest/dg/smtp-credentials.html

  iam_permissions = [
    "ses:SendCustomVerificationEmail",
    "ses:SendEmail",
    "ses:SendRawEmail",
    "ses:SendTemplatedEmail"
  ]

  ses_group_name = "platform-grp"
  user_name      = "platform-usr"

  iam_additional_statements = [
    {
      sid       = "Statistics"
      actions   = ["ses:GetSendQuota"]
      resources = ["*"]
    }
  ]
}


# DNS pagopa.it DEFINED on org-infra
# DNS platform.pagopa.it DEFINED on pagopa-infra

# https://selfcare.pagopa.it/
# subdomain
# - https://io.selfcare.pagopa.it/
# - https://selfcare.platform.pagopa.it/
# - ...
module "ses_selfcare_platform_pagopa_it" {
  source              = "github.com/pagopa/terraform-aws-ses.git?ref=v1.2.0"
  domain              = "platform.pagopa.it"
  mail_from_subdomain = "backoffice"
  aws_region          = var.aws_region

  iam_permissions = [
    "ses:SendCustomVerificationEmail",
    "ses:SendEmail",
    "ses:SendRawEmail",
    "ses:SendTemplatedEmail"
  ]

  ses_group_name = "BackOfficeSelfcarePlatformPagoPa"
  user_name      = "backoffice-selfcare-platform-pagopa"

  iam_additional_statements = [
    {
      sid       = "Statistics"
      actions   = ["ses:GetSendQuota"]
      resources = ["*"]
    }
  ]
}

# Nodo dei Pagamenti
module "ses_ndp_platform_pagopa_it" {
  source              = "github.com/pagopa/terraform-aws-ses.git?ref=v1.2.1"
  domain              = "platform.pagopa.it"
  mail_from_subdomain = "ndp"
  aws_region          = var.aws_region

  iam_permissions = [
    "ses:SendCustomVerificationEmail",
    "ses:SendEmail",
    "ses:SendRawEmail",
    "ses:SendTemplatedEmail"
  ]

  ses_group_name = "NdpPlatformPagoPa"
  user_name      = "ndp-platform-pagopa"

  iam_additional_statements = [
    {
      sid       = "Statistics"
      actions   = ["ses:GetSendQuota"]
      resources = ["*"]
    }
  ]
}
