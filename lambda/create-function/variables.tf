# -----------------------------------------------------------------------------
# Variables: Environment
# -----------------------------------------------------------------------------

# var.environment
variable "environment" {
  description = ""
  default     = "Test"
}

# -----------------------------------------------------------------------------
# Variables: Lambda
# -----------------------------------------------------------------------------

# REQUIRED
# var.service_name
variable "service_name" {
  description = ""
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

# var.lambda_timeout
variable "lambda_timeout" {
  description = "Lambda timeout"
  default     = "30"
}

variable "lambda_filename" {
  description = "Lambda filename"
  default     = "../package.zip"
}