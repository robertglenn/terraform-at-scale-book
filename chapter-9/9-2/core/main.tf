
resource "google_project_iam_policy" "core" {
  project     = var.app_proj_id
  policy_data = data.google_iam_policy.core.policy_data
}

data "google_iam_policy" "core" {
  binding {
    role = "roles/viewer"

    members = [
      "group:stakeholders@tas-9-2.com",
      "group:developers@tas-9-2.com",
      "serviceAccount:ops@${var.infra_proj_id}.iam.gserviceaccount.com",
      "serviceAccount:app-id@${var.app_proj_id}.iam.gserviceaccount.com"
    ]
  }

  binding {
    role = "roles/editor"
    members = [
      "serviceAccount:ops@${var.infra_proj_id}.iam.gserviceaccount.com",
    ]
  }
}
