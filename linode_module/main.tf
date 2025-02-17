resource "linode_instance" "terraform_linode_instance" {
  image           = var.image
  label           = var.label
  region          = var.region
  type            = var.type
  authorized_keys = [var.public_key_content]
  root_pass       = var.linode_root_password
}

resource "local_file" "ansible_inventory" {
  content  = <<EOF
[${var.ansible_hosts_group_name}]
${var.ansible_host_name} ansible_host=${linode_instance.terraform_linode_instance.ip_address} ansible_user=root ansible_ssh_private_key_file=${var.ansible_ssh_private_key_path}
EOF
  filename = var.ansible_hosts_file_path
}
