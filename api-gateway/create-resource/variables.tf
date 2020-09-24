# -----------------------------------------------------------------------------
# Variables: Environment
# -----------------------------------------------------------------------------

variable "aws_account_number" {
  description = "The AWS account number"
}


# var.environment
variable "environment" {
  description = ""
  default     = "Test"
}

variable "region" {
  description = "The AWS region"
  default = "us-east-1"
}

# var.service_name
variable "service_name" {
  description = "Service name"
}

# -----------------------------------------------------------------------------
# Variables: Api Gateway
# -----------------------------------------------------------------------------

# REQUIRED
# var.root_resource_id
variable "api_gateway_name" {
  description = "Name of the target API gateway"
}

variable "root_resource_id" {
  description = "Root resource id"
  default     = ""
}

# var.path_part
variable "path_part" {
  description = "Path part"
  default     = "{proxy+}"
}

# var.uri
variable "uri" {
  description = "Uri"
}

# var.function_name
variable "function_name" {
  description = "Function name"
}

# var.parent_id
variable "parent_id" {
  description = "Parent id"
  default     = ""
}

# var.qualifier
variable "qualifier" {
  description = "Qualifier"
}

# var.authorizer
variable "cognito_authorizer_name" {
  description = "Api Gateway Cognito Authorizer"
  type        = "map"
  default     = {
    Test  = "Cognito_Auth"
    Dev   = "Cognito_Auth"
    Prod  = "Cognito_Auth"
  }
}
