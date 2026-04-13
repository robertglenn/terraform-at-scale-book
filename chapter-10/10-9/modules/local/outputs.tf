
output "safe_name" {
  description = "Safe name constructed from the inputs."
  value       = local.safe_name

  precondition {
    condition     = local.valid_inputs
    error_message = "The computed resource name must be like {app_code}-{business_unit}-{region}"
  }
}
