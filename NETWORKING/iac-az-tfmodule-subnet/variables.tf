#Required Variables
variable "resource_group_name" {
  type        = string
  description = "The Resource Group name in which to put the Key Vault"

  #validation {
  #condition     = can(regex("^rg-[a-zA-Z]+-(?:pro|pre|play)-(?:z|a)-(?:weu|scp)$", var.resource_group_name))
  # error_message = "The Resource Group needs to follow the naming convention, e.g.:'rg-myapp-pro-z-weu'."
  #}
}

variable "vnetname" {
  type        = string
  description = "Name of the Key Vault"

  #validation {
  #condition     = can(regex("^kv-[a-zA-Z]+-(?:pro|pre|play)-(?:z|a)-(?:weu|scp)-\\d{3}$", var.kvname))
  # error_message = "The Key Vault name needs to follow the naming convention, e.g.:'kv-myapp-pro-z-weu-001'."
  #}
}

variable "address_prefixes" {
  type = list(string)
}

# variable "tags" {
#   type = map(string)
# }

variable "subnetname" {
  type        = string
  description = "Name of the acr_private_endpoint_subnet_name"

  #validation {
  #condition     = can(regex("^kv-[a-zA-Z]+-(?:pro|pre|play)-(?:z|a)-(?:weu|scp)-\\d{3}$", var.kvname))
  # error_message = "The acr_private_endpoint_subnet_name name needs to follow the naming convention, e.g.:'kv-myapp-pro-z-weu-001'."
  #}
}

variable "service_endpoints" {
  type = list(string)
}