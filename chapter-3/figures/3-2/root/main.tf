
module "network" {
  source = "../network"
  
  vpc_name = "vpc-tas-3-2"
  regions  = [ "us-central1", "us-east1", "us-west1" ]
}

module "gke" {
  for_each = module.network.subnet_names
  source   = "../cluster"

  subnet_name = each.value
}
