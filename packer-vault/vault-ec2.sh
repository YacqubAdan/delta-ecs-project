#!/bin/sh

# Download and move latest Vault release to bin.
printf "\n\nFetching Vault binary"
cd /opt/ && sudo curl -o vault.zip https://releases.hashicorp.com/vault/1.13.1/vault_1.13.1_linux_amd64.zip
sudo unzip vault.zip
sudo mv vault /usr/bin/

# Create a user named vault to be run as a service.
printf "\n\nCreating vault user"
sudo useradd --system --home /etc/vault.d --shell /bin/false vault

# Move configuration files
printf "\n\nConfiguring vault as system service"
sudo mv /tmp/vault.service /etc/systemd/system/vault.service
sudo mv /tmp/vault.hcl /etc/vault.d/vault.hcl

sudo mkdir /etc/vault.d
sudo chown -R vault:vault /etc/vault.d
sudo mkdir /vault-data
sudo chown -R vault:vault /vault-data
sudo mkdir -p /logs/vault/

# Start vault as a service
printf "\n\nEnabling vault as a service"
sudo systemctl enable vault
sudo systemctl start vault
sudo systemctl status vault