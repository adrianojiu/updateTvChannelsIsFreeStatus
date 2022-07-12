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

!!!Para destruir o ambiente:!!!

terraform destroy -var-file=stg.tfvars

Cuidado o comando acima destroy todo o ambiente criado pelo terraform. Só use se quiser realmente remover todos os recursos do projeto.


-----------------

## Prod
Criação de plano para aplicar a configuração em prod:

* **terraform plan -out=prod-plan -var-file=prod.tfvars**

Aplicando o plano acima em produção:

* **terraform apply prod-plan**

!!!Para destruir o ambiente:!!!

* **terraform destroy -var-file=prod.tfvars**

Cuidado o comando acima destroy todo o ambiente criado pelo terraform. Só use se quiser realmente remover todos os recursos do projeto.

# Variaveis

### "region"
É a região AWS onde o projeto deve rodar ou esta rodando. Deve ser setado no arquivo .tfvars.
type = string

### "aws_local_profile"
É o perfil local AWS que será usado para acessar a conta AWS, ele é solicitado toda vez que é executado o plan apply ou destroy.
type = string

### "function_name"
É o nome da função lamba que o projeto deve subir ou gerenciar. Deve ser setado no arquivo .tfvars.
type = string

### "webportal_address"
É o endereço do webportal do Claro TV+. Deve ser setado no arquivo .tfvars.
type = string

### "vpc_id"
É o ip da VPC onde a aplicação esta rodando. Deve ser setado no arquivo .tfvars.
type = string

### "lambda_subnets"
São as subnets onde a função lambda deve rodar. Deve ser setado no arquivo .tfvars.
type = list(string)

### "config_s3_key"
É o caminho do arquivo de configuração usado como variavel de ambiente pela função lambda. Deve ser setado no arquivo .tfvars.
type = string

### "api_key_bff"
É a chave de api usada para a função se conectar no bff/avsclient é usado como variavel de ambiente pela função. Deve ser setado no arquivo .tfvars.
type = string

### "function_description"
É a descrição da função lambda. Deve ser setado no arquivo .tfvars.
type = string

### "function_runtime"
É o Runtime definido para execução da função/aplicação lambda. Deve ser setado no arquivo .tfvars.
type = string

### "function_memory_size"
É o tamanho da memoria em mega bytes que será usado pela funç~~ao na sua execução. Deve ser setado no arquivo .tfvars.
type = number

### "function_timeout"
Tempo maximo permitido de execução da função lambda. Deve ser setado no arquivo .tfvars.
type = number

### "function_schedule"
O tempo que a função será invocada. Deve ser setado no arquivo .tfvars.
type = string

### "servicetag"
É o nome do serviço ao qual esta função pertence. Deve ser setado no arquivo .tfvars.
type = string

### "log_retention"
É o tempo em dias que o Cloudwatch irá manter os logs de execução da função. Deve ser setado no arquivo .tfvars.
type = number

### "function_version"
É a versão atual em que a aplicação esta rodando na versão, isso é importante para uma execução de apply/plan não seja setado o valo $LATEST no alias da função. É necessario pegar qual a versão esta sendo usada atualmente e inserir no momento da execução do apply/plan. Esta variavel é solicitada na execuçãod e um apply/plan.
type = string

-----------------
-----------------
-----------------
-----------------
![Terraform](/assets/terraform-vertical-color.png)
