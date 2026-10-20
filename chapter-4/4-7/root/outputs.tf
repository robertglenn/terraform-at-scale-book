
output "system_format" {
  value = upper(module.submodule.special_instance_name)

  precondition {
    # Disallowing a special sequence that would be misinterpreted
    condition     = !startswith(module.submodule.special_instance_name, "DEL")
    error_message = "The submodule created a disallowed instance name"
  }
}
