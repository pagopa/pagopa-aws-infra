variable "aws_region" {
  type        = string
  description = "AWS region used to create resources. Default: Milan"
  default     = "eu-south-1"
}

variable "app_name" {
  type        = string
  description = "Application name"
  default     = "lambdatemplate"
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

variable "lambda_log_retention" {
  type        = number
  default     = 30
  description = "Retention days for lambda function's logs"
}

variable "prefix" {
  type        = string
  description = "Application platform prefix"
  default     = "pagopa"
}

variable "tags" {
  type = map(any)
  default = {
    CreatedBy = "Terraform"
  }
}
