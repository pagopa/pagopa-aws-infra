variable "aws_region" {
  type        = string
  description = "AWS default region"
  default     = "eu-south-1"
}

variable "project_name" {
  type        = string
  description = "Azure devops project name."
  default     = "pagopa-aws-infra"
}

variable "project_description" {
  type        = string
  description = "Azure devops project description."
  default     = "AWS resources used by the project pagoPa Spa."
}

variable "iac" {
  default = {
    repository = {
      organization    = "pagopa"
      name            = "pagopa-aws-infra"
      branch_name     = "refs/heads/main"
      pipelines_path  = "src/pipelines"
      yml_prefix_name = null
    }
    pipeline = {
      enable_code_review = true
      enable_deploy      = true
    }
  }
}