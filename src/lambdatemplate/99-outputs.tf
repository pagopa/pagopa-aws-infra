output "lambdatemplate_function_name" {
  value = aws_lambda_function.lambdatemplate.function_name
}

output "lambdatemplate_function_url" {
  value = aws_lambda_function_url.lambdatemplate_latest.function_url
}
