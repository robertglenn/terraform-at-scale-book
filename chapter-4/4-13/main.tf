
locals {
  vm_nics_map = { for vm in google_compute_instance.gce_nodes :
    vm.instance_id => vm.network_interface
  }
  # resulting format: {
  # instance-id-1: { network_ip: string, access_config: list, ... },
  # instance-id-2: { network_ip: string, access_config: list, ... },
  # ...
  # }
}


resource "google_compute_instance" "gce_nodes" {
  for_each = toset(var.node_names)

  name         = each.value
  machine_type = "n2-standard-2"

  boot_disk {}

  network_interface {}
}

resource "google_dns_managed_zone" "prod" {
  name     = "my-zone"
  dns_name = "mydomain.com."
}

resource "google_dns_record_set" "vm_a_record" {
  for_each = local.vm_nics_map
  # VALID – each key is unique, includes all necessary information

  name         = "vm.${google_dns_managed_zone.prod.dns_name}"
  managed_zone = google_dns_managed_zone.prod.name
  type         = "A"
}