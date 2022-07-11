# Event bridge trigger rule.
resource "aws_cloudwatch_event_rule" "updateTvChannelsIsFreeStatus_lambda_event_rule" {
  name = "${var.function_name}-lambda-event-rule"
  description = "Run to trigger lambda function ${var.function_name} every ${var.function_schedule}."
  schedule_expression = "${var.function_schedule}"

        tags = {
        service = "${var.servicetag}"
        environment = "${terraform.workspace}"
        lambda = "${var.function_name}"
    }
    depends_on = [
      aws_lambda_alias.lambda_alias
    ]
}

# Event bridge trigger rule target.
resource "aws_cloudwatch_event_target" "updateTvChannelsIsFreeStatus_lambda_target" {
  arn = "${aws_lambda_function.UpdateTvChannels_lambda.arn}:${terraform.workspace}"
  rule = aws_cloudwatch_event_rule.updateTvChannelsIsFreeStatus_lambda_event_rule.name

  depends_on = [
      aws_lambda_alias.lambda_alias
  ]
}

# Event permission to invoke lambda.
resource "aws_lambda_permission" "allow_cloudwatch_to_call_rw_fallout_retry_step_deletion_lambda" {
  statement_id = "AllowExecutionFromCloudWatch"
  action = "lambda:InvokeFunction"
  function_name = aws_lambda_function.UpdateTvChannels_lambda.function_name
  principal = "events.amazonaws.com"
  source_arn = aws_cloudwatch_event_rule.updateTvChannelsIsFreeStatus_lambda_event_rule.arn
  qualifier = aws_lambda_alias.lambda_alias.name

    depends_on = [
      aws_lambda_alias.lambda_alias
  ]
}
