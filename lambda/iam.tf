# Allow lambda function call ssm parameters.
resource "aws_iam_policy" "lambda_test_UpdateTvChannels_ssm" {
  name        = "${var.function_name}-ssm-${terraform.workspace}"
  path        = "/"
  description = "Used to lambda function calls ssm parameters."

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "ssm:GetParameterHistory",
                "ssm:GetParametersByPath",
                "ssm:GetParameters",
                "ssm:GetParameter"
            ],
            "Resource": "*"
        }
    ]
})

      tags = {
        service = "${var.servicetag}"
        environment = "${terraform.workspace}"
        lambda = "${var.function_name}"
    }


}

# Role creation wich lambda function will use to access other resourcesa.
resource "aws_iam_role" "lambda_test-UpdateTvChannels" {
    name = "${var.function_name}-${terraform.workspace}"
    assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "lambda.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF
depends_on = [
  aws_iam_policy.lambda_test_UpdateTvChannels_ssm
]

      tags = {
        service = "${var.servicetag}"
        environment = "${terraform.workspace}"
        lambda = "${var.function_name}"
    }

}

# Attach policy in role created above.
resource "aws_iam_role_policy_attachment" "AWSLambdaVPCAccessExecutionRole" {
  role       = aws_iam_role.lambda_test-UpdateTvChannels.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
  
  depends_on = [
    aws_iam_role.lambda_test-UpdateTvChannels
  ]
 }

# Attach policy in role created above.
resource "aws_iam_role_policy_attachment" "lambda_test_UpdateTvChannels_ssm_policy" {
  role       = aws_iam_role.lambda_test-UpdateTvChannels.name
  policy_arn = aws_iam_policy.lambda_test_UpdateTvChannels_ssm.arn
  
  depends_on = [
    aws_iam_role.lambda_test-UpdateTvChannels
  ]
 }