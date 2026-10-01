# Sns configurations

data "aws_secretsmanager_secret" "email_operation" {
  count = var.env_short == "p" ? 1 : 0

  name = "operation/alerts"
}

data "aws_secretsmanager_secret_version" "email_operation_lt" {
  count = var.env_short == "p" ? 1 : 0

  secret_id = data.aws_secretsmanager_secret.email_operation.0.id
}

resource "aws_sns_topic" "alarms" {
  count = var.env_short == "p" ? 1 : 0

  name         = format("%s-alarms", local.project)
  display_name = "Alarms"
}

resource "aws_sns_topic_subscription" "alarms_email" {
  count = var.env_short == "p" ? 1 : 0

  endpoint = jsondecode(data.aws_secretsmanager_secret_version.email_operation_lt.0.secret_string)["email"]

  endpoint_auto_confirms = true
  protocol               = "email"
  topic_arn              = aws_sns_topic.alarms.0.arn
}

resource "aws_sns_topic_subscription" "alarms_slack" {
  count = var.env_short == "p" ? 1 : 0

  endpoint = jsondecode(data.aws_secretsmanager_secret_version.email_operation_lt.0.secret_string)["slack"]

  endpoint_auto_confirms = true
  protocol               = "email"
  topic_arn              = aws_sns_topic.alarms.0.arn
}