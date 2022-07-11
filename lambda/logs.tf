# Create CloudWatch log group for Lambda log destination and attach to IAM role.
# Lambda function will try to create a log group called /aws/lambda/<function name> if it doesn't exist.
resource "aws_cloudwatch_log_group" "lambda_logs" {
  name              = "/aws/lambda/${var.function_name}"
  retention_in_days = "${var.log_retention}"

        tags = {
        service = "${var.servicetag}"
        environment = "${terraform.workspace}"
        lambda = "${var.function_name}"
    }
}