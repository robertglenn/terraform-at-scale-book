
module "nested" {
  for_each = { for stack in var.stack_data : stack.app_name => stack }
  source   = "./modules/nested"

  network_id   = var.network_id
  app_name     = each.value.app_name
  region       = each.value.region
  zone         = each.value.zone
  machine_type = var.machine_type
  os_image     = var.os_image
}
