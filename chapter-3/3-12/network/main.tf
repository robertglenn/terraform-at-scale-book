
resource "google_compute_network" "vpc" {
  name = var.vpc_name
}

resource "google_compute_subnetwork" "snets" {
  for_each = { for region in var.regions : region => region }
  
  name = "${google_compute_network.vpc.name}-${each.value}-snet"
  region = each.value
  network = google_compute_network.vpc.id
}
