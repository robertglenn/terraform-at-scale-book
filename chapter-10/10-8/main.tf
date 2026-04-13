
module "local" {
  source = "./modules/local"

  app_code      = var.app_code
  business_unit = var.business_unit
  region        = var.region
}

resource "google_storage_bucket" "example" {
  name          = module.local.safe_name
  location      = "US"
  force_destroy = true
}
