variable "alb_rule_path" {}
variable "alb_rule_priority" {
  type = number
}
variable "cluster_id" {}
variable "container_definitions" {}
variable "container_name" {}
variable "container_port" {}
variable "desired_count" {
  type = number
}
variable "environment" {
  description = ""
}
variable "family" {}
variable "health_check_path" {}
variable "service_name" {}
variable "task_role_arn" {}
variable "vpc_id" {}



