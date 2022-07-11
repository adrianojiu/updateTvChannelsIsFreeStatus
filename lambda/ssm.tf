resource "aws_ssm_parameter" "secret" {
  name        = "${terraform.workspace}-bff-api-key"
  description = "API Key for the Backend for Frontend application, ${var.servicetag}."
  type        = "SecureString"
  value       = "${var.api_key_bff}"

  tags = {
    servico = "${var.servicetag}"
    environment = "${terraform.workspace}"
    lambda = "${var.function_name}"
  }
}