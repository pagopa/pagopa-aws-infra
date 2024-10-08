terraform {
  required_version = "~> 1.4.6"

  # TODO Uncomment once the backend S3 bucket is created and upload the state tate file.
  backend "s3" {}

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.44.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
  default_tags {
    tags = var.tags
  }
}

data "aws_caller_identity" "current" {}

data "aws_availability_zones" "available" {}