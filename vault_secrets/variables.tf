variable "mount_path" {
  description = "The path for the Vault mount"
  type        = string
}

variable "data_json" {
  description = "The JSON data for the Vault secrets"
  type        = string
  sensitive   = true
}

variable "token_ttl" {
  description = "The Time To Live period of the token. This is specified as a numeric string with suffix like '30s' or '5m'"
  type = string
  default     = "768h"
}