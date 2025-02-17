data "cloudflare_zones" "zone" {
  filter {
    name = var.cloudflare_zone
  }
}

resource "cloudflare_record" "dns_record" {
  zone_id = data.cloudflare_zones.zone.zones[0].id
  name    = var.subdomain
  content = var.ip_address
  type    = "A"
  ttl     = 1  # Use TTL of 1 for proxied records
  proxied = true
}
