# output token
output "token" {
  value     = vault_token.dedicated.client_token
  sensitive = true
}

# output "access_key" {
#   value = data.vault_generic_secret.dedicated.data["access_key"]
#   sensitive = true
# }

# output "secret_key" {
#   value = data.vault_generic_secret.dedicated.data["secret_key"]
#   sensitive = true
# }