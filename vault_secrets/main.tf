# create new KV store
resource "vault_mount" "dedicated" { #${vault_mount.dedicated.path}
  path        = var.mount_path
  type        = "kv-v2"
  description = "Dedicated kv (key value) store for ${var.mount_path} secrets"
}

# create read only policy to secret folder
resource "vault_policy" "dedicated" {
  name   = "${var.mount_path}_policy"
  policy = templatefile("${path.module}/templates/policy.tpl", { path = vault_mount.dedicated.path })
}

# generate token for related to policy
resource "vault_token" "dedicated" {
  policies = [vault_policy.dedicated.name]
  ttl      = var.token_ttl
  renewable = true
}

# store token and path in a .env file
resource "null_resource" "write_token" {
  provisioner "local-exec" {
    command = "echo 'VAULT_TOKEN=${vault_token.dedicated.client_token}' > .env && echo 'VAULT_MOUNT_POINT=${vault_mount.dedicated.path}' >> .env"
  }
  depends_on = [vault_token.dedicated]
}

# create secret
resource "vault_generic_secret" "dedicated" {
  path      = "${vault_mount.dedicated.path}/secrets"
  data_json = var.data_json
}

# data "vault_generic_secret" "dedicated" {
#   path = vault_generic_secret.dedicated.path #"${vault_mount.dedicated.path}/example"

#   depends_on = [
#     vault_generic_secret.dedicated
#   ]
# }

