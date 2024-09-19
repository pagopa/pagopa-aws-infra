# bucket afm fee for https://www.pagopa.gov.it/it/cittadini/trasparenza-costi/
resource "aws_s3_bucket" "afm_bucket_psp_fee_reporting" {
  bucket = "pagopa-${local.project}-st-fee"
}

# resource "aws_s3_bucket_acl" "afm_bucket_psp_fee_reporting_acl" {
#   bucket = aws_s3_bucket.afm_bucket_psp_fee_reporting.id
#   acl    = "public-read"
# }

# resource "aws_s3_bucket_server_side_encryption_configuration" "afm_bucket_psp_fee_encryption" {
#   bucket = aws_s3_bucket.afm_bucket_psp_fee_reporting.id

#   rule {
#     apply_server_side_encryption_by_default {
#       kms_master_key_id = aws_kms_key.aws_s3_key.key_id
#       sse_algorithm     = "aws:kms"
#     }
#   }
# }

resource "aws_s3_bucket_versioning" "afm_bucket_psp_fee_reporting_vers" {
  bucket = aws_s3_bucket.afm_bucket_psp_fee_reporting.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "afm_bucket_psp_fee_reporting_access" {
  bucket              = aws_s3_bucket.afm_bucket_psp_fee_reporting.id
  block_public_policy = false
}


#######
# Policy - Manage s3 
#######

resource "aws_s3_bucket_policy" "afm_bucket_psp_fee_reporting_bucket_policy" {
  bucket = aws_s3_bucket.afm_bucket_psp_fee_reporting.id
  policy = jsonencode({
    Version = "2012-10-17"
    Id      = "pagopa-${local.project}-st-fee-bucket_policy"
    Statement = [
      {
        Sid       = "AddGetPerm",
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "${aws_s3_bucket.afm_bucket_psp_fee_reporting.arn}/*"
      },
      {
        Sid : "AddPutPerm",
        Effect : "Allow",
        Principal : "*",
        Action : "s3:PutObject",
        Resource : "${aws_s3_bucket.afm_bucket_psp_fee_reporting.arn}/*"
      }
    ]
  })
}


resource "aws_iam_role" "afm_bucket_psp_fee_reporting_role" {
  name = "pagopa-${local.project}-st-fee-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Principal = {
          Service = "s3.amazonaws.com"
        },
        Effect = "Allow",
        Sid    = ""
      }
    ]
  })
}

resource "aws_iam_role_policy" "afm_bucket_psp_fee_reporting_access_policy" {
  name = "pagopa-${local.project}-st-fee-policy"
  role = aws_iam_role.afm_bucket_psp_fee_reporting_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = ["s3:GetObject*", "s3:ListBucket", "s3:PutObject", "s3:Replicate*"],
        Effect = "Allow",
        Resource = [
          "${aws_s3_bucket.afm_bucket_psp_fee_reporting.arn}/*",
          "${aws_s3_bucket.afm_bucket_psp_fee_reporting.arn}"
        ]
      },
      {
        Action = "kms:Decrypt",
        Effect = "Allow",
        Resource = [
          "${aws_kms_key.aws_s3_key.arn}"
        ]
      },
      {
        Action = ["kms:Encrypt", "kms:GenerateDataKey*", "kms:ReEncrypt*"],
        Effect = "Allow",
        Resource = [
          "${aws_kms_key.aws_s3_key.arn}"
        ]
      }
    ]
  })
}


resource "aws_iam_user_policy_attachment" "afm_bucket_psp_fee_reporting_iam_policy_attach" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  user       = aws_iam_user.afm_bucket_psp_fee_reporting_user.name
}

# how to show secrets
# terraform state pull | jq '.resources[] | select(.type == "aws_iam_access_key") | .instances[0].attributes'