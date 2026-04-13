
output "safe_name" {
  description = "Safe name constructed from the inputs."
  value       = "${var.app_code}-${var.business_unit}-${var.region}"
}
