
locals {
  name_value = "tas-4-7-network-name"
}

resource "google_compute_network" "vpc" {
  name = local.name_value
}
