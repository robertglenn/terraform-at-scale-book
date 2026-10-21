
variable "compute_project_id" {
  description = "Project in which to provision compute-related resources"
  type        = string
}

variable "network" {
  description = "VPC where the subnets get created"
  type        = string
}

variable "server_regions" {
  description = "Resource regions where compute resources will be created"
  type        = list(string)
}

variable "available_regions" {
  description = "Resource regions where network resources will be created"
  type        = list(string)
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

variable "gke_ports" {
  description = "The ports that GKE should open to the jumpboxes"
  type        = list(string)
  default     = ["22", "443", "10250", "30000–32767"]
}
