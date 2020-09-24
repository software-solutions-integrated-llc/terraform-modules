provider "aws" {
  alias = "cognito"
  profile = "sky"
  region = "us-east-1"
}

# Data sources
data "aws_api_gateway_rest_api" "ApiGateway" {
  name = "${var.api_gateway_name}-${var.environment}"
}

data "aws_cognito_user_pools" "CognitoUserPoolName" {
  name = var.cognito_authorizer_name[var.environment]
  provider = "aws.cognito"
}

# Parent APIGW Resource
resource "aws_api_gateway_resource" "Resource" {
  rest_api_id = "${data.aws_api_gateway_rest_api.ApiGateway.id}"
  parent_id   = "${var.parent_id == "" ? "${var.root_resource_id}" : "${var.parent_id}"}"
  path_part   = "${var.path_part}"
}

resource "aws_api_gateway_method" "Method" {
  rest_api_id   = "${data.aws_api_gateway_rest_api.ApiGateway.id}"
  resource_id   = "${aws_api_gateway_resource.Resource.id}"
  http_method   = "ANY"
  authorization = "COGNITO_USER_POOLS"
  authorizer_id = data.aws_cognito_user_pools.CognitoUserPoolName.id
}

resource "aws_api_gateway_integration" "Integration" {
  rest_api_id             = "${data.aws_api_gateway_rest_api.ApiGateway.id}"
  resource_id             = "${aws_api_gateway_resource.Resource.id}"
  http_method             = "${aws_api_gateway_method.Method.http_method}"
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = "${var.uri}"
}

# Lambda
resource "aws_lambda_permission" "LambdaPermission" {
  statement_id  = "${replace("AllowExecutionFrom_${var.function_name}_${var.path_part}", "/[{}+]+/", "")}"
  action        = "lambda:InvokeFunction"
  function_name = "${var.function_name}"
  principal     = "apigateway.amazonaws.com"
  qualifier     = "${var.qualifier}"
  source_arn = "arn:aws:execute-api:${var.region}:${var.aws_account_number}:${data.aws_api_gateway_rest_api.ApiGateway.id}/*/${aws_api_gateway_method.Method.http_method}${aws_api_gateway_resource.Resource.path}"
}

resource "aws_api_gateway_method_response" "response_200" {
  rest_api_id = "${data.aws_api_gateway_rest_api.ApiGateway.id}"
  resource_id = "${aws_api_gateway_resource.Resource.id}"
  http_method = "${aws_api_gateway_method.Method.http_method}"
  status_code = "200"
}
