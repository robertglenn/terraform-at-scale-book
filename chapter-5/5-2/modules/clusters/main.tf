
resource "google_container_cluster" "cluster" {
  for_each = var.subnets_data

  name                     = "${var.cluster_name}-${each.key}"
  project                  = var.project_id
  remove_default_node_pool = true
  initial_node_count       = 1
  location                 = each.value.region

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block = "${var.jumpbox_ips[each.key]}/32"
    }
  }
}

resource "google_container_node_pool" "node_pool" {
  for_each = var.subnets_data

  name     = "${var.cluster_name}-pool-${each.key}"
  project  = var.project_id
  cluster  = google_container_cluster.cluster.name
  location = each.value.region

  node_config {
    machine_type    = var.machine_type
    service_account = var.service_account
    tags            = ["${each.value.region}-nodes"]
  }

  network_config {
    subnetwork = each.value.self_link
  }
}
