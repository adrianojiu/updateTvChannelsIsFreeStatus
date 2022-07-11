variable "region" {}
variable "aws_local_profile" {}
variable "function_name" {}
variable "webportal_address" {}
variable "vpc_id" {}
variable "lambda_subnets" {}
variable "config_s3_key" {}
variable "api_key_bff" {}
variable "function_description" {}
variable "function_runtime" {}
variable "function_memory_size" {}
variable "function_timeout" {}
variable "function_schedule" {}
variable "servicetag"{}
variable "log_retention"{}
variable "function_version"{} # You must get the current version number which is running on the function if you don´t $LATEST will be setted up in this variable consequently in alias, be carefull.