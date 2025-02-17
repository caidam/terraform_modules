___

# Cloudflare Module

To avoid issues exclusively use Terraform to create or destroy DNS records related to the infrastructure.
Make sure a record of the same name doesn't already exist.

## TEMP EXAMPLE 

```hcl
# Cloudflare DNS Config

variable "subdomains" {
  description = "List of subdomains to create Cloudflare DNS records for"
  type        = list(string)
  default     = ["subdomain-one", "subdomain-two", "subdomain-three"]
}

module "cloudflare_dns" {
  for_each        = toset(var.subdomains) # Iterate over the list of subdomains
  source          = "git::https://github.com/caidam/terraform_modules.git//cloudflare_module"
  cloudflare_zone = var.cloudflare_zone
  subdomain       = each.value                                # This refers to the current subdomain in the iteration
  ip_address      = module.linode_instance.linode_instance_ip # Use the instance IP for each subdomain

  depends_on = [module.linode_instance]
}

```