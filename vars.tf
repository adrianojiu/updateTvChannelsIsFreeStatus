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
variable "function_version"{} # Você deve obter o número da versão atual que está sendo executada na função, caso contrário, $LATEST será configurado nesta variável consequentemente no alias, cuidado.