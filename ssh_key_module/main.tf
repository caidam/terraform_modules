resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "private_key" {
  content  = tls_private_key.example.private_key_pem
  filename = var.private_key_path
  file_permission = "0600"
}

resource "local_file" "public_key" {
  content  = tls_private_key.example.public_key_openssh
  filename = var.public_key_path
  file_permission = "0644"
}

output "private_key_path" {
  value = var.private_key_path
}

output "public_key_path" {
  value = var.public_key_path
}

output "private_key_content" {
  value     = tls_private_key.example.private_key_pem
  sensitive = true
}

output "public_key_content" {
  value = tls_private_key.example.public_key_openssh
  sensitive = false
}
