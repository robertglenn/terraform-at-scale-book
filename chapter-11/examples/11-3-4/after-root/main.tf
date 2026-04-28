
# *****************************************************************************
# Locals and Data Sources
# *****************************************************************************
locals {
  vpc_name                = "tas-11-vpc"
  location                = upper(split("-", local.region_one)[0])
  bucket_name             = "tas-11-bucket"
  region_one              = data.google_compute_zones.region_one.id
  zone_one                = data.google_compute_zones.region_one.names[0]
  region_two              = data.google_compute_zones.region_two.id
  zone_two                = data.google_compute_zones.region_two.names[0]
}

data "google_compute_zones" "region_one" {
  region = var.region_one
}

data "google_compute_zones" "region_two" {
  region = var.region_two
}

# *****************************************************************************
# Network Components
# *****************************************************************************
module "network" {
  source = "tas-module-registry.com/tas-11/network/google"

  project_id      = var.project_id
  vpc_name        = local.vpc_name
  region_one      = local.region_one
  region_two      = local.region_two
  region_one_cidr = var.region_one_cidr
  region_two_cidr = var.region_two_cidr
}

# *****************************************************************************
# Compute Instances
# *****************************************************************************
module "compute" {
  source = "tas-module-registry.com/tas-11/compute/google"

  project_id      = var.project_id
  region_one      = local.region_one
  zone_one        = local.zone_one
  disk_type       = var.disk_type
  disk_size       = var.disk_size
  machine_type    = var.machine_type
  boot_disk_image = var.boot_disk_image
  boot_disk_size  = var.boot_disk_size
  subnet_one_link = module.network.subnet_one_link
  subnet_two_link = module.network.subnet_two_link
}

# *****************************************************************************
# Other Componets
# *****************************************************************************

module "local_main" {
  source = "./modules/main"

  developer_group_email = var.developer_group_email
  project_id            = var.project_id
  location              = local.location
  bucket_name           = local.bucket_name
}
