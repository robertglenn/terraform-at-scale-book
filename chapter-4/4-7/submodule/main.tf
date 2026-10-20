
resource "google_compute_instance" "special_instance" {
  name         = "DELETE-ME"
  machine_type = "n2-standard-2"

  boot_disk {}

  network_interface {}
}
