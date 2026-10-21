
locals {
  server_subnets = {
    for id, snet in module.subnets.subnets_map : id => snet
    if contains(var.server_regions, snet.region)
  }
  firewall_data = {
    for id, snet in module.subnets.subnets_map : id => {
      region   = snet.region
      to_range = snet.range
      from_ips = (
        contains(var.server_regions, snet.region)
        ? ["${module.jumpboxes.compute_ips[id]}/32"] : []
      )
      target_tags = module.clusters.tags[id]
    }
  }
}

module "subnets" {
  source = "./modules/subnets"

  regions = var.available_regions
  network = var.network
  # ...
}

module "server_iam_identities" {
  source = "./modules/iam_identities"

  project_id    = var.compute_project_id
  identity_data = var.server_identity_data
  # ...
}

module "cluster_iam_identities" {
  source = "./modules/iam_identities"

  project_id    = var.compute_project_id
  identity_data = var.cluster_identity_data
  # ...
}

module "jumpboxes" {
  source = "./modules/compute"

  project_id      = var.compute_project_id
  subnets_data    = local.server_subnets
  service_account = module.server_iam_identities.account_email
  # ...
}

module "clusters" {
  source = "./modules/clusters"

  project_id      = var.compute_project_id
  subnets_data    = module.subnets.subnets_map
  service_account = module.cluster_iam_identities.account_email
  jumpbox_ips     = module.jumpboxes.compute_ips
  # ...
}

module "firewalls" {
  source = "./modules/firewalls"

  data      = local.firewall_data
  tcp_ports = var.gke_ports
  network   = var.network
  # ...
}
