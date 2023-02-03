# Resource related to the IAM role used by the lambda function
resource "aws_iam_role" "lambdatemplate_iam_role" {
  name = "serverless_lambdatemplate"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Sid    = ""
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }
    ]
  })
}

# Resource related to the policy associated to the lambda function's role
resource "aws_iam_role_policy_attachment" "lambda_policy" {
  role       = aws_iam_role.lambdatemplate_iam_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}