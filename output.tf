output "event_bridge_rule_name" {
  value = module.lambda.event_bridge_rule_name
}
output "event_bridge_rule_schedule" {
  value = module.lambda.event_bridge_rule_schedule
}
output "event_bridge_rule_target" {
  value = module.lambda.event_bridge_rule_target
}
output "lambda_function_name" {
  value = module.lambda.lambda_function_name
}
output "lambda_function_runtime" {
  value = module.lambda.lambda_function_runtime
}
output "lambda_function_role" {
  value = module.lambda.lambda_function_role
}
output "cloudwatch_logs_name" {
  value = module.lambda.cloudwatch_logs_name
}
output "cloudwatch_logs_retention" {
  value = module.lambda.cloudwatch_logs_retention
}
output "lambda_security_group" {
  value = module.lambda.lambda_security_group
}

