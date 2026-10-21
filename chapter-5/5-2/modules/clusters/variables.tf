
variable "project_id" {
  description = "Project in which to provision resources"
  type        = string
}

variable "cluster_name" {
  description = "Name for the cluster"
  type        = string
  default     = "tas-5-2-cluster"
}

variable "subnets_data" {
  description = "Subnetwork used data to create the clusters"
  type = map(object({
    region    = string
    range     = string
    self_link = string
  }))
}

variable "service_account" {
  description = "Service account email to attach to clusters"
  type        = string
}

variable "jumpbox_ips" {
  description = "Jumpbox IPs to include in authorized networks"
  type        = map(string)
}

variable "machine_type" {
  description = "Machine type for the cluster nodes"
  type        = string
  default     = "n2-standard-8"
}
