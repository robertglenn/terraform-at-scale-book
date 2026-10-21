
resource "google_service_account" "service_accounts" {
  account_id = var.identity_data.id
}

resource "google_project_iam_member" "service_account_permissions" {
  for_each = toset(var.identity_data.roles)

  project = var.project_id
  member  = google_service_account.service_accounts.name
  role    = each.value
}
