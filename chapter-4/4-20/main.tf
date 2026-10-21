
resource "google_compute_network" "internal_network" {
  name = "internal-vpc"
}

resource "google_compute_firewall" "internal_allow_firewalls" {
  for_each = var.firewall_configs

  name    = each.value.firewall_name
  network = google_compute_network.internal_network.name

  dynamic "allow" {
    for_each = each.value.allow_configs

    content {
      protocol = allow.value.protocol
      ports    = length(allow.value.ports) > 0 ? allow.value.ports : null
    }
  }
}
