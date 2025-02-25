resource "azurerm_web_application_firewall_policy" "wafpolicy" {
  name                = var.waf_policy.waf_policy_name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags

  policy_settings {
    enabled                     = var.waf_policy.policy_settings_enabled
    mode                        = var.waf_policy.policy_settings_mode
    request_body_check          = var.waf_policy.policy_settings_request_body_check
    file_upload_limit_in_mb     = var.waf_policy.policy_settings_file_upload_limit_in_mb
    max_request_body_size_in_kb = var.waf_policy.policy_setting_max_request_body_size_in_kb
  }

  managed_rules {
    managed_rule_set {
      type    = var.waf_policy.managed_rule_type
      version = var.waf_policy.managed_rule_version
    }
  }
}
