
resource "google_compute_firewall" "fws" {
  for_each = var.config_map

  name    = each.value.firewall_name
  network = each.value.network_name

  allow {
    protocol = "tcp"
    ports = [
      for item in var.port_data : item.port
      if item.protocol == "tcp"
    ]
  }
}
