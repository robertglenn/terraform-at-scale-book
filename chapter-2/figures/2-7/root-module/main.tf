
module "tas-2-7-intermediate-module-module" {
  source = "../intermediate-module-module"

  # Both will produce validation errors in the third-party module
  intermediate_string_key  = "camelCaseString"
  intermediate_number_list = [42, -2, 0, 13]
}
