
locals {
  valid_app    = contains(["app1", "app2", "app3"], var.app_code)
  valid_bu     = contains(["bu1", "bu2"], var.business_unit)
  valid_region = contains(["us-west1", "us-east1", "us-central1"], var.region)
  valid_inputs = local.valid_app && local.valid_bu && local.valid_region
  safe_name    = "${var.app_code}-${var.business_unit}-${var.region}"
}
