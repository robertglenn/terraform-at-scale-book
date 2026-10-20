
vms_map = {
  vm_key1 = {
    app_id       = "tas-3-9"
    zone         = "us-central1-a"
    machine_type = "n2-standard-2"
    network      = "tas-3-9-untrust-vpc"
    image        = "debian-cloud/debian-11"
  }
  vm_key2 = {
    app_id       = "tas-3-9"
    zone         = "us-central1-b"
    machine_type = "n2-standard-4"
    network      = "tas-3-9-untrust-vpc"
    image        = "ubuntu-os-cloud/ubuntu-2204-lts"
  }
  vm_key3 = {
    app_id       = "tas-3-9"
    zone         = "us-central1-c"
    machine_type = "n2-standard-8"
    network      = "tas-3-9-untrust-vpc"
    image        = "rocky-linux-cloud/rocky-linux-9-optimized-gcp"
  }
}
