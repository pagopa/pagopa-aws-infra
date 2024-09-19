resource "aws_kms_key" "aws_s3_key" {
  description             = var.kms_keys["s3"].description
  deletion_window_in_days = var.kms_keys["s3"].deletion_window
}