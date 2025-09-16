
module "tas-2-8-submodule" {
  source = "../submodule"

  submodule_string_key  = var.submodule_variable.string_val
  submodule_number_list = var.submodule_variable.number_list_val
}
