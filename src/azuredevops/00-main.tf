terraform {
  required_version = "~> 1.1.5"

  ## TODO move this part as external configuration when you bild PROD.
  backend "s3" {
    bucket         = "terraform-backend-6051"
    key            = "prod/devops/tfstate"
    region         = "eu-south-1"
    dynamodb_table = "terraform-lock"
    profile        = "ppa-pagopa-prod" # https://pagopa.atlassian.net/wiki/spaces/DEVOPS/pages/425066634/AWS+-+Accounts
  }

  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "= 0.1.8"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.22.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

/*
# copy this block for each environment (aws account) you want to deploy into.
provider "aws" {
  alias   = "<environment [dev|uat|prod]>"
  profile = "<aws account name>"
  region  = var.aws_region
}
*/