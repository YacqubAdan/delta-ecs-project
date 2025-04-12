#!/bin/bash

VAULT_ADDR="$VAULT_ADDR"
VAULT_TOKEN="$VAULT_TOKEN"

AWS_ACCESS_KEY_ID=$(vault kv get -field=AWS_ACCESS_KEY kv/aws-secrets/aws-access)
AWS_SECRET_ACCESS_KEY=$(vault kv get -field=AWS_SECRET_KEY kv/aws-secrets/aws-access)

echo "AWS Credentials Retrieved Successfully"

echo "::add-mask::$AWS_ACCESS_KEY_ID"
echo "::add-mask::$AWS_SECRET_ACCESS_KEY"

echo "AWS_ACCESS=$AWS_ACCESS_KEY_ID" >> $GITHUB_ENV
echo "AWS_SECRET=$AWS_SECRET_ACCESS_KEY" >> $GITHUB_ENV