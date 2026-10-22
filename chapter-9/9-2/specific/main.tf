
resource "google_bigquery_dataset" "dataset" {
  dataset_id = var.dataset_id
}

resource "google_bigquery_dataset_iam_policy" "specific" {
  project     = var.app_proj_id
  dataset_id  = google_bigquery_dataset.dataset.dataset_id
  policy_data = data.google_iam_policy.specific.policy_data
}

data "google_iam_policy" "specific" {
  binding {
    role = "roles/bigquery.admin"

    members = [
      "group:developers@tas-9-2.com",
    ]
  }

  binding {
    role = "roles/bigquery.connectionUser"

    members = [
      "serviceAccount:app-id@${var.app_proj_id}.iam.gserviceaccount.com"
    ]
  }
}
