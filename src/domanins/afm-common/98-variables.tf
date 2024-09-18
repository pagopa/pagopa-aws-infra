variable "aws_region" {
  type        = string
  description = "AWS region to create resources. Default Milan"
  default     = "eu-central-1"
}

variable "domain" {
  type        = string
  default     = "afm"
  description = "Domain"
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

variable "tags" {
  type = map(any)
  default = {
    CreatedBy = "Terraform"
  }
}

variable "kms_keys" {
  type = map(object({
    description     = string
    deletion_window = number
  }))
  description = "Map of KMS Keys"
}
