
resource "google_organization_policy" "gcp_domain_restriction" {
  org_id     = "1234567890"
  constraint = "constraints/iam.allowedPolicyMemberDomains"

  list_policy {
    allow {
      values = ["is:C01234abc"]
    }
  }
}
