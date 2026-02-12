
# this module only contains resource{} blocks
module "local" {
  source = "./modules/local"
  ...
}

# this module has module{} blocks embedded within it
module "remote" {
  source  = "terraform-google-modules/network/google"
  version = ">= 12.0.0, < 13.0.0"

  project_id = module.local.project_id
  ...
}
