output "event_bridge_rule_name" {
  value = aws_cloudwatch_event_rule.updateTvChannelsIsFreeStatus_lambda_event_rule.name
}
output "event_bridge_rule_schedule" {
  value = aws_cloudwatch_event_rule.updateTvChannelsIsFreeStatus_lambda_event_rule.schedule_expression
}
output "event_bridge_rule_target" {
  value = aws_cloudwatch_event_target.updateTvChannelsIsFreeStatus_lambda_target.arn
}
output "lambda_function_name" {
  value = aws_lambda_function.UpdateTvChannels_lambda.function_name
}
output "lambda_function_runtime" {
  value = aws_lambda_function.UpdateTvChannels_lambda.runtime
}
output "lambda_function_role" {
  value = aws_lambda_function.UpdateTvChannels_lambda.role
}
output "cloudwatch_logs_name" {
  value = aws_cloudwatch_log_group.lambda_logs.name
}
output "cloudwatch_logs_retention" {
  value = aws_cloudwatch_log_group.lambda_logs.retention_in_days
}
output "lambda_security_group" {
  #value = module.aws_security_group.lambda_allowed.tags.Name
  value = "${lookup(aws_security_group.lambda_allowed.tags, "Name")}"
}