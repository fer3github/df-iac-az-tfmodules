# variable "waf_policy_name" {
#   type = string
#   description = "(Required) Waf Policy Name"
# }

variable "waf_policy" {
  type = object({
    waf_policy_name                            = string
    policy_settings_enabled                    = bool
    policy_settings_mode                       = string
    policy_settings_request_body_check         = bool
    policy_settings_file_upload_limit_in_mb    = number
    policy_setting_max_request_body_size_in_kb = number
    managed_rule_type                          = string
    managed_rule_version                       = string
  })
}

variable "location" {
  type        = string
  description = "(Required) Resource Group Location"
}

variable "resource_group_name" {
  type        = string
  description = "(Required) Resource Group Name"
}
variable "tags" {}

# # Por defecto es true y siempre vamos a quererlo en true
# variable "policy_settings_enabled" {
#   type        = bool
#   # default     = true
# }

# variable "policy_settings_mode"{
#   type = string
#   # default = "Prevention"
# }

# variable "policy_settings_request_body_check"{
#   type = bool
#   # default = true
# } 

# variable "policy_settings_file_upload_limit_in_mb"{
#   type        = number
#   # default     = 100
# }

# variable "policy_setting_max_request_body_size_in_kb"{
#   type        = number
#   # default     = 128
# }

# variable "managed_rule_type"{
#   type        = string
#   # default     = "OWASP"
# }

# variable "managed_rule_version" {
#   type        = string
#   # default     = "3.2"
# }

# variable "tags" {
#   type = map(string)
# }

