
variable "project_id" {
  type        = string
  description = "ID of the Project that houses the Global Application Load Balancer."
}

variable "alb_name" {
  type        = string
  description = "Name of the global application load balancer."
}

variable "blocked_country_codes" {
  type        = list(string)
  description = "Country codes for blocked countries"
}

variable "service_host" {
  type        = string
  description = "Hostname for the application services."
}

variable "assets_host" {
  type        = string
  description = "Hostname for the application assets."
}

variable "ssl_private_key_path" {
  type        = string
  description = "SSL private key path to upload."
}

variable "ssl_cert_path" {
  type        = string
  description = "SSL certificate path to upload."
}

variable "gcs_bucket_name" {
  type        = string
  description = "Name of GCS bucket housing application assets."
}

variable "gke_neg_self_link" {
  type        = string
  description = "Self Link for GKE NEG hosting application services"
}
