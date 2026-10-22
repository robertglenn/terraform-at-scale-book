
variable "project_id" {
  description = "ID of the Project that houses the Global Application Load Balancer."
  type        = string
}

variable "alb_name" {
  description = "Name of the global application load balancer."
  type        = string
}

variable "blocked_country_codes" {
  description = "Country codes for blocked countries"
  type        = list(string)
}

variable "service_host" {
  description = "Hostname for the application services."
  type        = string
}

variable "assets_host" {
  description = "Hostname for the application assets."
  type        = string
}

variable "ssl_private_key_path" {
  description = "SSL private key path to upload."
  type        = string
}

variable "ssl_cert_path" {
  description = "SSL certificate path to upload."
  type        = string
}

variable "gcs_bucket_name" {
  description = "Name of GCS bucket housing application assets."
  type        = string
}

variable "gke_neg_self_link" {
  description = "Self Link for GKE NEG hosting application services"
  type        = string
}
