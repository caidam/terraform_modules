# Terraform Vault Secrets Module

This module manages a dedicated Key-Value (KV) store and associated policies in HashiCorp Vault.

> The generated Vault token and mount point are written to a .env file.

> The token is renewable and is attached to a read-only policy, meaning it only allows read operations on this specific KV store.

## Usage

- `main.tf` : 

~~~hcl
module "vault_secrets" {
  source = "git::https://github.com/caidam/terraform_modules.git//vault_secrets"

  mount_path = "my_secrets" # Name of the kv store

  data_json  = var.vault_secrets # Json file storing the secrets as key value pairs

  token_ttl  = "768h" # The Time To Live period of the token, specified as a numeric string with suffix like '30s' or '5m'
}
~~~

- `provider.tf` : 

~~~hcl
provider "vault" {
  address = var.vault_address
  token   = var.vault_token
}
~~~

- `variables.tf` :

~~~hcl
variable "vault_address" {
  description = "Address of the HCP Vault"
  type        = string
}

variable "vault_token" {
  description = "Token with relevant permissions to read, write, create, delete resources on the HCP Vault"
  type        = string
}

variable "vault_secrets" {
  description = "JSON data for the secrets"
  type        = string
}
~~~

- `.tfvars` : 

~~~hcl
vault_secrets = <<EOT
{
  "access_key": "your-access-key",
  "secret_key": "your-secret-key",
  "random_secret":  "your-random-secret"
}
EOT
~~~

## Resources

This module creates the following resources:

1. **vault_mount.dedicated**: A dedicated KV store for storing secrets.
2. **vault_policy.dedicated**: A read-only policy for the secret folder.
3. **vault_token.dedicated**: A token associated with the policy.
4. **null_resource.write_token**: A local provisioner that writes the token and mount point to a .env file.
5. **vault_generic_secret.dedicated**: A secret stored in the KV store.

