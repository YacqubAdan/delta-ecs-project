#!/bin/bash

export VAULT_ADDR=${{ vars.VAULT_ADDR }}
VAULT_ROLE_ID=${{ secrets.VAULT_ROLE_ID }}
VAULT_SECRET_ID=${{ secrets.VAULT_SECRET_ID }}
VAULT_TOKEN=$(vault write -field=token auth/approle/login role_id=$VAULT_ROLE_ID secret_id=$VAULT_SECRET_ID)
echo "::add-mask::$VAULT_TOKEN"
echo "VAULT_TOKEN=${VAULT_TOKEN}" >> $GITHUB_ENV