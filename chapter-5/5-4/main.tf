
variable "network_data" {
  description = "Network data for VPC networks."

  type = object({
    domain = string
    ranges = list(string)
  })
}

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
  ranges  = module.vpc.ranges
}
