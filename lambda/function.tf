resource "aws_lambda_function" "UpdateTvChannels_lambda" {
  # If the file is not in the current working directory you will need to include a 
  # path.module in the filename.
  filename      = "update_tv_channels_is_free_status.zip"
  function_name = "${var.function_name}"
  role          = aws_iam_role.lambda_test-UpdateTvChannels.arn
  handler       = "index.handler"
  memory_size = "${var.function_memory_size}"
  timeout     = "${var.function_timeout}"
  description = "${var.function_description}"
  vpc_config {
    security_group_ids = [aws_security_group.lambda_allowed.id] #aws_security_group.lambda_allowed.
    subnet_ids = "${var.lambda_subnets}"
  }

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
  #source_code_hash = filebase64sha256("lambda_function_payload.zip")

  runtime = "${var.function_runtime}"

  environment {
    variables = {
      BFF_API_KEY_PARAMETER_STORE_KEY = "${terraform.workspace}-bff-api-key"
      BFF_CHANNELS_CONFIG_S3_KEY = "${var.config_s3_key}"
      HOST_URL = "${var.webportal_address}"
      SSM_PARAMETER_STORE_PREFIX = "${terraform.workspace}"
      SSM_REGION = "${var.region}"
    }
  }

      tags = {
        service = "${var.servicetag}"
        environment = "${terraform.workspace}"
    }

  depends_on = [
    aws_iam_role.lambda_test-UpdateTvChannels,
    aws_ssm_parameter.secret
  ]
}

resource "aws_lambda_alias" "lambda_alias" {
  name             = "${terraform.workspace}"
  description      = "This should be the current version, $LATEST will be setted up by Terraform if you don´t delare a value for function_version variable when run Terrafrom apply, better set a stable version in when terraform apply for function_version variable."
  function_name    = aws_lambda_function.UpdateTvChannels_lambda.arn
  function_version = var.function_version != "" ? var.function_version : "$LATEST"
  #function_version = "$LATEST"
}