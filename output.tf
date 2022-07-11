# Request output from child module, lambda - Event bridge rule name".
output "event_bridge_rule_name" {
  value = module.lambda.event_bridge_rule_name
}
# Request output from child module, lambda - Event bridge rule schedule time frequence".
output "event_bridge_rule_schedule" {
  value = module.lambda.event_bridge_rule_schedule
}
# Request output from child module, lambda - Event bridge rule schedule target".
output "event_bridge_rule_target" {
  value = module.lambda.event_bridge_rule_target
}
# Request output from child module, lambda function name".
output "lambda_function_name" {
  value = module.lambda.lambda_function_name
}
# Request output from child module, lambda function runtime".
output "lambda_function_runtime" {
  value = module.lambda.lambda_function_runtime
}
# Request output from child module, lambda function role".
output "lambda_function_role" {
  value = module.lambda.lambda_function_role
}
# Request output from child module, cloudwatch logs name".
output "cloudwatch_logs_name" {
  value = module.lambda.cloudwatch_logs_name
}
# Request output from child module, cloudwatch logs retention in days".
output "cloudwatch_logs_retention" {
  value = module.lambda.cloudwatch_logs_retention
}
# Request output from child module, lambda security group".
output "lambda_security_group" {
  #value = module.aws_security_group.lambda_allowed.tags.Name
  #value = "${lookup(module.aws_security_group.lambda_allowed.tags, "Name")}"
  value = module.lambda.lambda_security_group
}

