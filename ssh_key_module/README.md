TODO

# SSH Key

```hcl
module "ssh_key" {
  source           = "git::https://github.com/caidam/terraform_modules.git//ssh_key_module"
  private_key_path = "path/to/${var.private_key_path}"
  public_key_path  = "path/to/${var.public_key_path}"
}

data "local_file" "public_key" {
  filename   = module.ssh_key.public_key_path
  depends_on = [module.ssh_key]
}
```
