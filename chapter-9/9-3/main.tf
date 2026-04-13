
# IP
resource "google_compute_global_address" "global_alb" {
  name = "${var.alb_name}-ip"
}

# WAF
resource "google_compute_security_policy" "waf" {
  name = "${var.alb_name}-waf"

  # Basic OWASP
  rule {
    priority = 1000
    action   = "deny(403)"

    match {
      versioned_expr = "PRECONFIGURED_WAF"

      expr {
        expression = "evaluatePreconfiguredWaf('owasp-crs-v030001')"
      }
    }
  }

  # Block specific countries
  dynamic "rule" {
    for_each = { for val in var.blocked_country_codes : parseint(val, 10) => val }

    content {
      priority = 10000 + rule.key
      action   = "deny(403)"

      match {
        expr {
          expression = "origin.region_code == '${rule.value}'"
        }
      }
    }
  }

  # All other traffic
  rule {
    priority = 2147483647
    action   = "allow"

    match {
      versioned_expr = "SRC_IPS_V1"
      config {
        src_ip_ranges = ["*"]
      }
    }
  }
}

# Application Load Balancer Frontend
resource "google_compute_url_map" "https_map" {
  name = "${var.alb_name}-url-map"

  host_rule {
    hosts        = [var.service_host]
    path_matcher = "gke"
  }

  host_rule {
    hosts        = [var.assets_host]
    path_matcher = "gcs"
  }

  path_matcher {
    name            = "gke"
    default_service = google_compute_backend_service.gke_backend.id
  }

  path_matcher {
    name            = "gcs"
    default_service = google_compute_backend_bucket.gcs_backend.id
  }
}

resource "google_compute_target_https_proxy" "https" {
  name             = "${var.alb_name}-https-proxy"
  url_map          = google_compute_url_map.https_map.id
  ssl_certificates = [google_compute_ssl_certificate.cert.id]
}

resource "google_compute_global_forwarding_rule" "https" {
  name                  = "${var.alb_name}-https-forwarding"
  ip_address            = google_compute_global_address.global_alb.address
  port_range            = "443"
  target                = google_compute_target_https_proxy.https.id
  load_balancing_scheme = "EXTERNAL_MANAGED"
}

resource "google_compute_url_map" "http_redirect" {
  name = "${var.alb_name}-http-redirect"

  default_url_redirect {
    https_redirect = true
    strip_query    = false
  }
}

resource "google_compute_target_http_proxy" "http" {
  name    = "${var.alb_name}-http-proxy"
  url_map = google_compute_url_map.http_redirect.id
}

resource "google_compute_global_forwarding_rule" "http" {
  name                  = "${var.alb_name}-http-forwarding"
  ip_address            = google_compute_global_address.global_alb.address
  port_range            = "80"
  target                = google_compute_target_http_proxy.http.id
  load_balancing_scheme = "EXTERNAL_MANAGED"
}

# Security
resource "google_compute_ssl_certificate" "cert" {
  name        = "${var.alb_name}-cert"
  private_key = file(var.ssl_private_key_path)
  certificate = file(var.ssl_cert_path)
}

# Application Load Balancer Backends
resource "google_compute_backend_bucket" "gcs_backend" {
  name        = "${var.alb_name}-gcs-backend"
  bucket_name = var.gcs_bucket_name
  enable_cdn  = false
}

resource "google_compute_backend_service" "gke_backend" {
  name                  = "${var.alb_name}-gke-backend"
  protocol              = "HTTP"
  load_balancing_scheme = "EXTERNAL_MANAGED"
  port_name             = "http"
  timeout_sec           = 30

  backend {
    group = var.gke_neg_self_link
  }

  security_policy = google_compute_security_policy.waf.id

  log_config {
    enable      = true
    sample_rate = 1.0
  }
}

# Logging
resource "google_storage_bucket" "armor_logs" {
  name                        = "${var.alb_name}-armor-logs"
  location                    = "US"
  uniform_bucket_level_access = true
}

resource "google_logging_project_sink" "armor_sink" {
  name        = "${var.alb_name}-armor-sink"
  destination = "storage.googleapis.com/${google_storage_bucket.armor_logs.name}"

  filter                 = "resource.type=\"http_load_balancer\""
  unique_writer_identity = true
}

# IAM
resource "google_storage_bucket_iam_member" "sink_writer" {
  bucket = google_storage_bucket.armor_logs.name
  role   = "roles/storage.objectCreator"
  member = google_logging_project_sink.armor_sink.writer_identity
}
