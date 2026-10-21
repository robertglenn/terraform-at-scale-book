
module "app_trust" {
  source = "./modules/stack"

  app_name   = var.app_name
  project_id = var.app_trust_project
  os_image   = var.os_image
  trusted    = true
}

module "app_untrust" {
  source = "./modules/stack"

  app_name   = var.app_name
  project_id = var.app_untrust_project
  os_image   = var.os_image
}
