# Backend state file remote location.
terraform {
  backend "s3" {
    bucket = "tf-files-infra-base-test-lab" # Set bucket.
    #dynamodb_table = "terraform-state-lock-dynamo-lab-infra"          # Set table if you want to manage lock for yor operations in Terraform.
    key     = "test-UpdateTvChannels/lab-infra-base.tfstate" # Set file key.
    region  = "us-east-1"
    encrypt = true
    profile = "1"
  }
}

# Uncomment below to create table to manage terraform locking operations, and change in backend config.
# DynammoDB terraform for state locking.
/*
resource "aws_dynamodb_table" "dynamo-db-terraform-state-lock" {
  name           = "terraform-state-lock-dynamo-lab-infra"
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20
  provider       = aws.us_east_1

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "DynamoDB Terraform State Lock table"
  }

}
*/