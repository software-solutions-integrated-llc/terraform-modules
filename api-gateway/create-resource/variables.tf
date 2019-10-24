# -----------------------------------------------------------------------------
# Variables: Environment
# -----------------------------------------------------------------------------

# var.environment
variable "environment" {
  description = ""
  default     = "Test"
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
variable "root_resource_id" {
  description = "Root resource id"
  type        = "map"
  default     = {
    Test  = "jin6fqniq2"
    Dev   = "6tr682e6e0"
    Prod  = "cbtap9m9r0"
  }
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