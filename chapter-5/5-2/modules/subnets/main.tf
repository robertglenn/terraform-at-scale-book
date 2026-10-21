
resource "google_compute_subnetwork" "snet" {
  for_each = toset(var.regions)

  name    = "snet-tas-5-2-${each.value}"
  region  = each.value
  network = var.network
}
