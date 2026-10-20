
module "network" {
  source = "../network"

  vpc_name = "vpc-tas-3-12"
  regions  = ["us-central1", "us-east1", "us-west1"]
}

resource "google_storage_bucket" "regional_log_bucket" {
  for_each = toset(module.network.subnets[*].region)

  location = upper(each.value)
  name     = "bucket-for-${module.network.vpc_name}-in-${each.value}"
}
