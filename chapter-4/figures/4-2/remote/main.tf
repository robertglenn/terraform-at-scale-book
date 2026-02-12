
resource google_dns_managed_zone "special" {
  count = var.dns_domain != "" ? 1 : 0

  name     = "special-zone"
  dns_name = "special.${var.dns_domain}."
}

resource google_dns_record_set "a_record" {
  count = var.dns_domain != "" ? 1 : 0

  name         = var.dns_domain
  type         = "A"
  managed_zone = google_dns_managed_zone.special.name
}
