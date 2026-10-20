
locals {
  outputs_map  = { for el in module.remote.element_list : el.name => el }
  output_names = [for el in module.remote.element_list : el.name]
}

module "remote" {
  source = "third-party-remote-module"
}