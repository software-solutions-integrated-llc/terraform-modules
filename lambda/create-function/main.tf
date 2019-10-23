# Data sources
data "aws_iam_role" "lambda_iam_role" {
  name = "lambda_basic_execution"
}

# Lambda API
resource "aws_lambda_function" "lambda" {
  filename              = "${var.lambda_filename}"
  function_name         = "${var.service_name}"
  role                  = "${data.aws_iam_role.lambda_iam_role.arn}"
  handler               = "${var.lambda_handler}"
  memory_size           = "${var.lambda_memory_size}"
  timeout               = "${var.lambda_timeout}"
  vpc_config {
    subnet_ids          = []
    security_group_ids  = []
  }
  # The filebase64sha256() function is used to trigger updates
  source_code_hash = "${filebase64sha256("${var.lambda_filename}")}"
  runtime = "${var.lambda_runtime}"
}