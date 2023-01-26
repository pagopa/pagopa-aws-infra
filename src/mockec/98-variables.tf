variable "aws_region" {
  type        = string
  description = "AWS region to create resources. Default Milan"
  default     = "eu-central-1"
}

variable "app_name" {
  type        = string
  description = "App name."
  default     = "mock-ec"
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "Environment"
}

variable "env_short" {
  type        = string
  default     = "d"
  description = "Evnironment short."
}

variable "lambda_log_retention" {
  type        = number
  default     = 30
  description = "Log retention"
}

variable "tags" {
  type = map(any)
  default = {
    CreatedBy = "Terraform"
  }
}
