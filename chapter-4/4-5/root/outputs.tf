
output "direct_compute_resource_name" {
  description = "Accessing the module's compute instance name through the direct output"
  value       = module.submodule.module_compute_data_name
}

output "embedded_compute_resource_name" {
  description = "Accessing the module's compute instance name through the object output"
  value       = module.submodule.module_compute_data.name
}

output "full_submodule_reference" {
  description = "Accessing all the outputs specified in the module's output definitions"
  value       = module.submodule
}
