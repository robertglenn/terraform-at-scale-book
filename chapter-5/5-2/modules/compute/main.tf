
resource "google_compute_instance" "default" {
  for_each = var.subnets_data

  project      = var.project_id
  name         = "tas-5-2-jump-${each.value}"
  machine_type = var.machine_type

  boot_disk {}

  network_interface {
    subnetwork = each.value.self_link
  }
}
