
resource "google_compute_instance" "module_compute" {
  name         = "module-instance"
  machine_type = "n2-standard-2"

  boot_disk {}

  network_interface {}
}
