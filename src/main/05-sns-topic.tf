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