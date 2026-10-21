
resource "google_compute_network" "vpc" {
  name = "vpc-4-14"
}

resource "google_compute_subnetwork" "snets_count" {
  count = 10

  name    = "snet-4-14-${count.index}"
  region  = var.subnet_regions[count.index]
  network = google_compute_network.vpc.id
}

resource "google_compute_subnetwork" "snets_for_each" {
  for_each = toset(var.subnet_regions)

  name    = "snet-4-14-${each.value}"
  region  = var.subnet_regions[each.value]
  network = google_compute_network.vpc.id
}
