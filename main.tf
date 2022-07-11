terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.74"
    }
  }
  required_version = "~> 1.1.8"
}

provider "aws" {
  region  = var.region
  profile = var.aws_local_profile
}

module "lambda" {
  source = "./lambda/"

  function_name        = var.function_name
  vpc_id               = var.vpc_id
  lambda_subnets       = var.lambda_subnets
  webportal_address    = var.webportal_address
  region               = var.region
  config_s3_key        = var.config_s3_key
  api_key_bff          = var.api_key_bff
  function_description = var.function_description
  function_runtime     = var.function_runtime
  function_memory_size = var.function_memory_size
  function_timeout     = var.function_timeout
  function_schedule    = var.function_schedule
  servicetag           = var.servicetag
  log_retention        = var.log_retention
  function_version     = var.function_version
}