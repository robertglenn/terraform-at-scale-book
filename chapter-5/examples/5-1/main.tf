
locals {
  server_subnets = { 
    for id, snet in module.subnets.subnets_map: id => snet 
    if contains(var.server_regions, snet.region)
  }
  firewall_data = {
    for id, snet in module.subnets.subnets_map: id => {
      region   = snet.region
      to_range = snet.range
      from_ips = (
        contains(var.server_regions, snet.region) 
        ? concat(
            module.jumpboxes[id].ip, 
            module.clusters[id].cluster_ips
          ) 
        : module.clusters[id].cluster_ips
      )
    }
  }
}

module "subnets" {
  source = "./modules/subnets"

  regions = var.available_regions
  ...
}

module "server_iam_identities" {
  source = "./modules/iam_identities"

  identity_data = var.server_identity_data
  ...
}

module "cluster_iam_identities" {
  source = "./modules/iam_identities"

  identity_data = var.cluster_identity_data
  ...
}

module "jumpboxes" {
  source = "./modules/compute"

  subnets_data  = local.server_subnets
  identity_data = module.server_iam_identities.identities_map
  ...
}

module "clusters" {
  source = "./modules/clusters"

  subnets_data  = module.subnets.subnets_map
  identity_data = module.cluster_iam_identities.identities_map
  jumpbox_ips   = module.jumpboxes.jumpboxes_map
  ...
}

module "firewalls" {
  source = "./modules/firewalls"

  data = local.firewall_data
  ...
}
