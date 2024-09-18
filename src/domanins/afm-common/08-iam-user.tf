resource "aws_iam_user" "afm_bucket_psp_fee_reporting_user" {
  name = "pagopa-${local.project}-fee-usr"
}


resource "aws_iam_access_key" "afm_bucket_psp_fee_reporting_bucket_key" {
  user    = aws_iam_user.afm_bucket_psp_fee_reporting_user.name
}