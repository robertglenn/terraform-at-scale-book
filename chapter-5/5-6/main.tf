
module "app_1_dev" {
  source = "./modules/stack"

  app_name   = var.app_1_name
  project_id = var.app_1_dev_project
}

module "app_1_prod" {
  source = "./modules/stack"

  app_name   = var.app_1_name
  project_id = var.app_1_prod_project
}

module "app_2_dev" {
  source = "./modules/stack"

  app_name   = var.app_2_name
  project_id = var.app_2_dev_project
}

module "app_2_prod" {
  source = "./modules/stack"

  app_name   = var.app_2_name
  project_id = var.app_2_prod_project
}
