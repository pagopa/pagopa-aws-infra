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

# Resource related to the IAM role used for the access to the ECR in order to push images on ECR
resource "aws_iam_role" "lambdatemplate_ecraccess_iam_role" {
  name = "lambdatemplate_ecraccess"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow",
      Principal = {
        "Federated" : "arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/token.actions.githubusercontent.com"
      },
      Action = "sts:AssumeRoleWithWebIdentity",
      Condition = {
        StringLike = {
          "token.actions.githubusercontent.com:sub" : "repo:${var.github_lambda_repository}:*"
        },
        "ForAllValues:StringEquals" = {
          "token.actions.githubusercontent.com:iss" : "https://token.actions.githubusercontent.com",
          "token.actions.githubusercontent.com:aud" : "sts.amazonaws.com"
        }
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

# Resource related to the policy associated to the full access to ECR for pushing the new images
resource "aws_iam_role_policy_attachment" "lambdatemplate_ecr_full_access" {
  role       = aws_iam_role.lambdatemplate_ecraccess_iam_role.name
  policy_arn = data.aws_iam_policy.ec2_ecr_full_access.arn
}

# Resource related to the policy associated to the full access to EC2 ECR
data "aws_iam_policy" "ec2_ecr_full_access" {
  name = "AmazonEC2ContainerRegistryFullAccess"
}