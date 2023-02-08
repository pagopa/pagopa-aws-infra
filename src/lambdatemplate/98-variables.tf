variable "aws_region" {
  type        = string
  default     = "eu-south-1"
  description = "AWS region used to create resources. Default: Milan"
}

variable "app_name" {
  type        = string
  default     = "lambdatemplate"
  description = "Application name"
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "Deploy environment"
}

variable "env_short" {
  type        = string
  default     = "d"
  description = "Abbreviation for deploy environment"
}

variable "github_lambda_repository" {
  type        = string
  default     = "pagopa/pagopa-aws-lambda-template"
  description = "GitHub repository related to the Lambda function project"
}

variable "image_tag_mutability" {
  type        = string
  default     = "MUTABLE"
  description = "Image mutability for container registry"
}

variable "lambda_log_retention" {
  type        = number
  default     = 30
  description = "Retention days for lambda function's logs"
}

variable "prefix" {
  type        = string
  default     = "pagopa"
  description = "Application platform prefix"
}

variable "tags" {
  type = map(any)
  default = {
    CreatedBy = "Terraform"
  }
}
