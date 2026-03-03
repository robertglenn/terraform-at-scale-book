# Example execution: tf plan -var-file=environments/prod.tf
# (Possibly after setting up backend with tf init)
project_id      = "tas-8-2-prod"
subnet_cidr     = "10.10.0.0/16"
serverless_cidr = "10.8.0.0/28"
db_name         = "appdb-prod"
