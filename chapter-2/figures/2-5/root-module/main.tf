
module "module-with-complex-variable" {
  source = "../submodule"

  complex_module_field = var.complex_module_variable
}
