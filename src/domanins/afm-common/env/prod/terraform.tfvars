env_short   = "p"
environment = "prod"

# Ref: https://pagopa.atlassian.net/wiki/spaces/DEVOPS/pages/132810155/Azure+-+Naming+Tagging+Convention#Tagging
tags = {
  CreatedBy   = "Terraform"
  Environment = "Prod"
  Owner       = "pagopa-afm-common"
  Source      = "https://github.com/pagopa/pagopa-afm-fee-reporting-service.git"
  CostCenter  = "TS310 - PAGAMENTI e SERVIZI"
}

kms_keys = {
  s3 = {
    description     = "PAGOPA - KMS S3 key",
    deletion_window = 10
  },
  s3_replica = {
    description     = "PAGOPA - KMS S3 Replica key",
    deletion_window = 10
  }
}
