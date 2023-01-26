output "lambda_mockec_bucket_name" {
  value = aws_s3_bucket.lambda_bucket_temporaney.bucket
}
output "lambda_mockec_bucket_domain_name" {
  value = aws_s3_bucket.lambda_bucket_temporaney.bucket_domain_name
}

output "lambda_mockec_bucket_regional_domain_name" {
  value = aws_s3_bucket.lambda_bucket_temporaney.bucket_regional_domain_name
}

output "lambda_mockec_function_name" {
  value = aws_lambda_function.mock_ec.function_name
}

output "lambda_mockec_function_url" {
  value = aws_lambda_function_url.mock_ec_latest.function_url
}

