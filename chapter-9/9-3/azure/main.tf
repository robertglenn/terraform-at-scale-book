
resource "azuread_b2b_invitation_policy" "azure_domain_restriction" {
  policy_type     = "allowList"
  allowed_domains = ["yourcompany.com"]
}
