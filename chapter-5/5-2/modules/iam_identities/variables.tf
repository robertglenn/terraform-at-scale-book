
variable "project_id" {
  description = "GCP project in which to provision service accounts"
  type        = string
}

variable "identity_data" {
  description = "ID and IAM roles for the service account"
  type = object({
    id    = string
    roles = list(string)
  })
}
