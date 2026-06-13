
module "module_with_complex_variable" {
  source = "../submodule"

  complex_module_field = var.complex_module_variable
}
