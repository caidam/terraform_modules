variable "cloudflare_zone" {
  description = "The zone (domain) in Cloudflare"
  type        = string
}

variable "subdomain" {
  description = "The subdomain to manage"
  type        = string
}

variable "ip_address" {
  description = "The IP address to set for the A record"
  type        = string
}
