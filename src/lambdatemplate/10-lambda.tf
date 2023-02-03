# Provisioner for login on AWS ECR resources
resource "null_resource" "container_registry_login" {
  provisioner "local-exec" {
    command = <<EOF
                aws ecr get-login-password --region ${var.aws_region} | docker login --username AWS --password-stdin ${local.ecr_url}
                EOF
    interpreter = ["bash", "-c"]
  }
}

# Data related to Docker lambda image
data "aws_ecr_image" "lambdatemplate_image" {
  depends_on = [
    null_resource.container_registry_login
  ]
  repository_name = local.ecr_repository_name
  image_tag       = local.ecr_image_tag
}

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