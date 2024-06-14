path "${path}/*" {
  capabilities = ["read", "list"]
}

# Allow token renewal
path "auth/token/renew" {
  capabilities = ["update"]
}