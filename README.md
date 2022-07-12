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



