#!/bin/bash

# Example of execution:
#                               Arguments: aws profile / function name / git branch / nodejs version / aws region / alias
# ./deploy-updatetvchannelsisfreestatus.sh dev-now updateTvChannelsIsFreeStatus develop 14 us-east-1 stg
# Git clone will request username and password.

git clone https://gitdev.clarobrasil.mobi/produtos-digitais/now-online/now-bff/updatetvchannelsisfreestatus.git

cd updatetvchannelsisfreestatus

git checkout $3

export NVM_DIR=~/.nvm
source ~/.nvm/nvm.sh

nvm use $4

npm install

zip -9r update_tv_channels_is_free_status.zip node_modules src index.js

aws lambda --profile $1 update-function-code --function-name $2 --zip-file fileb://update_tv_channels_is_free_status.zip --region $5
aws lambda --profile $1 publish-version --function-name $2 --region $5

sleep 10
NEW_VERSION=$(aws lambda --profile $1 --region $5 publish-version --function-name $2 | jq -r .Version)

aws lambda --profile $1 --region $5 update-alias --function-name $2 --name $6 --function-version $NEW_VERSION

rm update_tv_channels_is_free_status.zip
