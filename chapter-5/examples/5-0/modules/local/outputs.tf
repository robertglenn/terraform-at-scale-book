
output "safe_name" {
  description = "Safe name constructed from the inputs."
  value       = local.safe_name
}

output "safe_labels" {
  description = "Safe labels constructed from the inputs and a timestamp."
  value       = local.safe_labels
}
