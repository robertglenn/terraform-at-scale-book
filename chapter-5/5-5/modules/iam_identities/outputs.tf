
output "account_email" {
  description = "Service identity email"
  value       = google_service_account.service_accounts.email
}