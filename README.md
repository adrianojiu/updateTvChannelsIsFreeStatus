# Lambda function updateTvChannelsIsFreeStatus

Função usada para atualização de configuração(channels.json) que indica quem o canal esta com sinal aberto. 
Repositorio git "https://gitdev.clarobrasil.mobi/produtos-digitais/now-online/now-bff/updatetvchannelsisfreestatus/-/tree/main"

# Backend
AWS profile deve ser setado na mão caso seja alterado para outro bucket.
Conta usada para armazenar o backend é a prd-now.
DynamoDB usado para gerenciar o state locking.

# Constrains
Verificar no arquivo .main.tf.
Neste arquivo tambem é possivel ver chamadas para modulos e provider.

# Outputs
Verificar outputs no arquivo .output.tf.

# Arquivos de variaveis
* stg.tfvars --> Arquivo de definições de variaveis para workspace/ambiente de staging(stg)/preprod.
* prod.tfvars --> Arquivo de definições de variaveis para workspace/ambiente de produção(prd)/prod.

# Workspaces
* stg - Este é o workspace para o ambiente de dev-now/staging/stg/preprod.
* prd - Este é o workspace para o ambiente de prd-now/produção/prd/prod.

# inicial deploy
Arquivo "update_tv_channels_is_free_status.zip" usado par ao primeiro deploy do ambiente.

# Modulo lambda
É o modulo usado para criar a função e suas dependencias.
O modulo cria o alias da aplicação baseado no nome workspace, ex: stg ou prd.

# Deploy de aplicação
O deploy(exeto na criação do ambiente) da aplicação não é feito pelo terraform, isso deve ser feito pelo script "deploy_script.sh" exemplo de execução e argumentos deste script estão em comentartio no proprio script.

# Exemplo de execução
## Preprod
Criação de plano para aplicar a configuração em preprod:

* **terraform plan -out=stg-plan -var-file=stg.tfvars**

Aplicando o plano acima em pré produção:

* **terraform apply stg-plan**

-----------------

## Prod
Criação de plano para aplicar a configuração em prod:

* **terraform plan -out=prod-plan -var-file=prod.tfvars**

Aplicando o plano acima em produção:

* **terraform apply prod-plan**



[Terraform](https://camo.githubusercontent.com/1a4ed08978379480a9b1ca95d7f4cc8eb80b45ad47c056a7cfb5c597e9315ae5/68747470733a2f2f7777772e6461746f636d732d6173736574732e636f6d2f323838352f313632393934313234322d6c6f676f2d7465727261666f726d2d6d61696e2e737667)
