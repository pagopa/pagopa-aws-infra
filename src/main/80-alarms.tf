# Sns configurations

data "aws_secretsmanager_secret" "email_operation" {
  name = "operation/alerts"
}

data "aws_secretsmanager_secret_version" "email_operation_lt" {
  secret_id = data.aws_secretsmanager_secret.email_operation.id
}

resource "aws_sns_topic" "alarms" {
  name         = format("%s-alarms", local.project)
  display_name = "Alarms"
}

resource "aws_sns_topic_subscription" "alarms_email" {
  endpoint = jsondecode(data.aws_secretsmanager_secret_version.email_operation_lt.secret_string)["email"]

  endpoint_auto_confirms = true
  protocol               = "email"
  topic_arn              = aws_sns_topic.alarms.arn
}

resource "aws_sns_topic_subscription" "alarms_slack" {
  endpoint = jsondecode(data.aws_secretsmanager_secret_version.email_operation_lt.secret_string)["slack"]

  endpoint_auto_confirms = true
  protocol               = "email"
  topic_arn              = aws_sns_topic.alarms.arn
}


## Alarms

### Sendign quotas

module "daily_sending_quota_alarm" {
  source  = "terraform-aws-modules/cloudwatch/aws//modules/metric-alarm"
  version = "~> 3.0"

  alarm_name          = "ses-daily-sading-quota"
  actions_enabled     = true
  alarm_description   = "Alarm when an unhealthy count is greater than one in the target"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  threshold           = 40000
  period              = 60 * 60 * 24 # 1 day
  unit                = "Count"

  namespace   = "AWS/SES"
  metric_name = "Send"
  statistic   = "Sum"

  alarm_actions = [aws_sns_topic.alarms.arn]
}

# The percentage of emails sent from your account that resulted in recipients reporting them as spam 
# based on a representative volume of email.
module "reputation_complaint_rate_alarm" {
  source  = "terraform-aws-modules/cloudwatch/aws//modules/metric-alarm"
  version = "~> 3.0"

  alarm_name          = "ses-reputation-complaint-rate"
  actions_enabled     = true
  alarm_description   = "Alarm when an unhealthy count is greater than one in the target"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  threshold           = 0.8
  period              = 60 * 60
  unit                = "Count"

  namespace   = "AWS/SES"
  metric_name = "Reputation.ComplaintRate"
  statistic   = "Average"

  alarm_actions = [aws_sns_topic.alarms.arn]
}