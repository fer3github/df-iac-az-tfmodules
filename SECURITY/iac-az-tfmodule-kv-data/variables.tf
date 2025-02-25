#Required Variables
variable "resource_group_name" {
  type        = string
  description = "The Resource Group name in which to put the Key Vault"

  #validation {
  #condition     = can(regex("^rg-[a-zA-Z]+-(?:pro|pre|play)-(?:z|a)-(?:weu|scp)$", var.resource_group_name))
  # error_message = "The Resource Group needs to follow the naming convention, e.g.:'rg-myapp-pro-z-weu'."
  #}
}

variable "location" {
  type        = string
  description = "The Resource Group location in which to put the Key Vault"
}

variable "kvname" {
  type        = string
  description = "Name of the Key Vault"

  #validation {
  #condition     = can(regex("^kv-[a-zA-Z]+-(?:pro|pre|play)-(?:z|a)-(?:weu|scp)-\\d{3}$", var.kvname))
  # error_message = "The Key Vault name needs to follow the naming convention, e.g.:'kv-myapp-pro-z-weu-001'."
  #}
}

variable "sku_name" {
  type        = string
  default     = "standard"
  description = "The Name of the SKU used for this Key Vault. Either 'standard' or 'premium'"
}

variable "enabled_for_deployment" {
  type        = bool
  description = "Enable Key Vault to be used in deployment"
  default     = false
}

variable "enabled_for_disk_encryption" {
  type        = bool
  description = "Enable Key Vault to be used in disk encryption"
  default     = false
}

variable "enabled_for_template_deployment" {
  type        = bool
  description = "Enable Key Vault to be used in ARM templates deployments"
  default     = false
}

variable "kv_rbac_auth" {
  type        = bool
  description = "Boolean flag to specify whether Azure Key Vault uses Role Based Access Control (RBAC) for authorization of data actions"
}

variable "kv_purge_protection" {
  type        = bool
  description = "Enable Purge Protection"
}

variable "public_network_access_enabled" {}

variable "network_acls" {
  default = null
}

variable "tags" {
  type = map(string)
  default = {
    businessunit = "Cloud"
    costcenter   = "IT"
    deployedBy   = "terraform/azure/caf-enterprise-scale"
    Environment  = "DEV"
    workgroup    = "SISTEMAS"
  }
}





