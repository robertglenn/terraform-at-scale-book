
locals {
  complex_module_local = {
    string_key     = var.string_key_var
    number_map_key = var.number_map_key_var
    object_key     = {
      number_sub_key      = var.number_sub_key_var
      string_list_sub_key = var.string_list_sub_key_var
    }
  }
}

module "module-with-complex-local-value" {
  source = "third-party-module-tas-2-4"

  complex_module_field = local.complex_module_local
}
