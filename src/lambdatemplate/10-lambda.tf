# Resource related to the lambda function
resource "aws_lambda_function" "lambdatemplate" {
  function_name    = "lambdatemplate-${var.env_short}-lambda"
  role             = aws_iam_role.lambdatemplate_iam_role.arn
  timeout          = 300
  image_uri        = format("%s@%s", local.ecr_repository_url, data.aws_ecr_image.lambdatemplate_image.id)
  package_type     = "Image"
}

# Resource related to the lambda function's URL
resource "aws_lambda_function_url" "lambdatemplate_latest" {
  depends_on = [
    aws_lambda_function.lambdatemplate
  ]
  function_name      = aws_lambda_function.lambdatemplate.function_name
  authorization_type = local.lambda_invocation_auth
}

# Resource related to the CloudWatch log system used by lambda function
resource "aws_cloudwatch_log_group" "lambdatemplate" {
  depends_on = [
    aws_lambda_function.lambdatemplate
  ]
  name = "/aws/lambda/${aws_lambda_function.lambdatemplate.function_name}"
  retention_in_days = var.lambda_log_retention
}