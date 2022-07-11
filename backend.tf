# Local remoto do arquivo de estado de back-end.
terraform {
  backend "s3" {
    bucket = "terraform-tfstate-clarotvmais"
    #dynamodb_table = "terraform-state-lock-dynamo-lab-infra"          # Set table if you want to manage lock for yor operations in Terraform.
    key     = "updateTvChannelsIsFreeStatus/updateTvChannelsIsFreeStatus.tfstate" # Caso tenha mais de um workspace o arquivo sera armazenado na pasta do workspace que sera criada nesta mesma.
    region  = "sa-east-1"
    encrypt = true
    profile = "prd-now"
  }
}

# Descomente abaixo para criar uma tabela para gerenciar state locking do terraform e altere a configuração do backend acima.
# Terraform do DynammoDB para bloqueio de estado.
/*
resource "aws_dynamodb_table" "dynamo-db-terraform-state-lock" {
  name           = "terraform-tfstate-clarotvmais"
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20
  provider       = aws

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "DynamoDB Terraform State Lock table"
  }

}
*/