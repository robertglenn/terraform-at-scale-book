
resource "google_project_iam_policy" "core" {
  project     = var.project_id
  policy_data = data.google_iam_policy.core.policy_data
}

data "google_iam_policy" "core" {
  binding {
    role = "roles/viewer"

    members = [
      "group:stakeholders@tas-9-2.com",
      "group:developers@tas-9-2.com",
      "serviceAccount:infra-ops@${var.infra_project_id}.iam.gserviceaccount.com",
      "serviceAccount:app-identity@${var.project_id}.iam.gserviceaccount.com",
    ]
  }

  binding {
    role = "roles/editor"

    members = [
      "serviceAccount:infra-ops@${var.infra_project_id}.iam.gserviceaccount.com",
    ]
  }
}
