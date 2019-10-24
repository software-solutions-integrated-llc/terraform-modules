# module.<module_name>.function_name
output "function_name" {
  value = "${aws_lambda_function.lambda.function_name}"
}

# module.<module_name>.uri
output "uri" {
  value = "${aws_lambda_function.lambda.invoke_arn}"
}

# module.<module_name>.alias_name
output "alias_name" {
  value = "${aws_lambda_alias.lambda_alias.name}"
}

# module.<module_name>.invoke_arn
output "alias_invoke_arn" {
  value = "${aws_lambda_alias.lambda_alias.invoke_arn}"
}