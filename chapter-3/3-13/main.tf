
locals {
  first_item   = substr(data.google_compute_machine_types.example.machine_types[0].name, 0, 8)
  second_item  = substr(data.google_compute_zones.available.names[0], 0, 10)
  final_string = "vm-${local.first_item}-${local.second_item}"
}

data "google_compute_machine_types" "example" {}

data "google_compute_zones" "names" {}

resource "google_compute_instance" "vm" {
  name         = local.final_string
  machine_type = data.google_compute_machine_types.example.machine_types[0].name
  zone         = data.google_compute_zones.available.names[0]

  boot_disk {}

  network_interface {}
}
