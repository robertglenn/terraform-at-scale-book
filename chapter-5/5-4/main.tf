
module "vpc" {
  source = "./modules/vpc"

  network_data = var.network_data
}

module "firewalls" {
  source = "./modules/firewalls"

  network = module.vpc.network
  ranges  = module.vpc.ranges
}

module "dns" {
  source = "./modules/dns"

  network = module.vpc.network
  domain  = var.network_data.domain
}
