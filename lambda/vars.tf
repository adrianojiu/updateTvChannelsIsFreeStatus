variable "function_name" {
  type = string
}
variable "vpc_id" {
  type = string
}
variable "lambda_subnets" {
  type = list(string)
}
variable "webportal_address" {
  type = string
}
variable "region" {
  type = string
}
variable "config_s3_key" {
  type = string
}
variable "api_key_bff" {
  type = string
}
variable "function_description" {
  type = string
}
variable "function_runtime" {
  type = string
}
variable "function_memory_size" {
  type = number
}
variable "function_timeout" {
  type = number
}
variable "function_schedule" {
  type = string
}
variable "servicetag" {
  type = string
}
variable "log_retention" {
  type = number
}
variable "function_version" {}