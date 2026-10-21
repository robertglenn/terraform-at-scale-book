
variable "compute_project_id" {
  description = "Project in which to provision compute-related resources"
  type        = string
}

variable "server_identity_data" {
  description = "IAM service account data for jumpbox resources"
  type = object({
    id    = string
    roles = list(string)
  })
}

variable "cluster_identity_data" {
  description = "IAM service account data for GKE resources"
  type = object({
    id    = string
    roles = list(string)
  })
}
