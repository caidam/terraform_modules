variable "mount_path" {
  description = "The path for the Vault mount"
  type        = string
}

variable "data_json" {
  description = "The JSON data for the Vault secrets"
  type        = string
  sensitive   = true
}