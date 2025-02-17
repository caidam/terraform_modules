TODO

## Linode Instance

```hcl
module "linode_instance" {
  source = "git::https://github.com/caidam/terraform_modules.git//linode_module"

  label                        = "name-of-the-instance"
  public_key_content           = replace(module.ssh_key.public_key_content, "\n", "") # when used with ssh_key_module
  linode_root_password         = var.linode_root_password
  ansible_hosts_file_path      = "path/to/host/file"
  ansible_hosts_group_name     = "group-name"
  ansible_host_name            = "host-name"
  ansible_ssh_private_key_path = "../${var.private_key_path}"

  depends_on = [data.local_file.public_key] # when used with ssh_key_module
}

output "linode_instance_ip" {
  value = module.linode_instance.linode_instance_ip
}
```