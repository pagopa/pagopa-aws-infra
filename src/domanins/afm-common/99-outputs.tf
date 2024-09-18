output "afm_bucket_psp_fee_reporting_bucket_name" {
  value = aws_s3_bucket.afm_bucket_psp_fee_reporting.bucket
}
output "afm_bucket_psp_fee_reporting_bucket_domain_name" {
  value = aws_s3_bucket.afm_bucket_psp_fee_reporting.bucket_domain_name
}

output "afm_bucket_psp_fee_reporting_bucket_regional_domain_name" {
  value = aws_s3_bucket.afm_bucket_psp_fee_reporting.bucket_regional_domain_name
}

output "afm_bucket_psp_fee_reporting_bucket_user_access_key_id" {
  value = aws_iam_access_key.afm_bucket_psp_fee_reporting_bucket_key.id
}

output "afm_bucket_psp_fee_reporting_bucket_user_secret_access_key" {
  value     = aws_iam_access_key.afm_bucket_psp_fee_reporting_bucket_key.secret
  sensitive = true
}

output "afm_bucket_psp_fee_reporting_bucket_user_secret_access_key_secret" {
  value     = aws_iam_access_key.afm_bucket_psp_fee_reporting_bucket_key.encrypted_secret
  sensitive = true
}
