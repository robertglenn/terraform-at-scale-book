
output "simple_reference_output" {
  description = "Name of the simplest configuration bucket"
  value       = google_storage_bucket.simplest.name
}

output "forin_expression_output" {
  description = "Several bucket names using for/in"
  value       = [for b in google_storage_bucket.multiple_buckets : b.name]
}

output "splat_reference_output" {
  description = "Several bucket names using Splat"
  value       = google_storage_bucket.multiple_buckets[*].name
}
