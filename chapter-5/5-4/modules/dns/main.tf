
resource "google_dns_managed_zone" "default" {
  name     = var.domain
  dns_name = "${var.domain}."
}
