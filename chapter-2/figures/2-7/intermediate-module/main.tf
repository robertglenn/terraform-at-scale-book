
module "tas-2-7-third-party-module" {
  source = "../third-party-module"

  third_party_module_field = {
    string_key = var.intermediate_string_key
    digit_map_key = { for val in var.intermediate_number_list : "item-${val}" => val }
  }
}
