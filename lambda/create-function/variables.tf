# -----------------------------------------------------------------------------
# Variables: Environment
# -----------------------------------------------------------------------------

# var.environment
variable "environment" {
  description = "Environment"
  default     = "Test"
}


# -----------------------------------------------------------------------------
# Variables: Lambda
# -----------------------------------------------------------------------------

# REQUIRED
# var.service_name
variable "service_name" {
  description = "Service name"
}

# var.lambda_handler
variable "lambda_handler" {
  description = "Lambda handler"
}

# var.runtime
variable "lambda_runtime" {
  description = "Lambda runtime"
}

# OPTIONAL
# var.lambda_memory_size
variable "lambda_memory_size" {
  description = "Memory size"
  default     = "256"
}

# var.lambda_role
variable "lambda_role" {
  description = "The role the lambda will assume"
  default = "lambda_basic_execution"
}


# var.lambda_timeout
variable "lambda_timeout" {
  description = "Lambda timeout"
  default     = "30"
}

# var.subnet_ids
variable "subnet_ids" {
  description = "Subnet ids"
  type        = "list"
  default     = [
  ]
}

# var.security_group_ids
variable "security_group_ids" {
  description = "Security group ids"
  type        = "list"
  default     = [
  ]
}

# var.lambda_filename
variable "lambda_filename" {
  description = "Lambda filename"
  default     = "../package.zip"
}
