#Required Variables
variable "resource_group_name" {
  type        = string
  description = "The Resource Group name in which to put the Key Vault"
}

variable "location" {
  type        = string
  description = "The Resource Group location in which to put the Key Vault"
}

variable "kvname" {
  type        = string
  description = "Name of the Key Vault"
}

variable "sku_name" {
  type        = string
  default     = "standard"
  description = "The Name of the SKU used for this Key Vault. Either 'standard' or 'premium'"
}

variable "kv_purge_protection" {
  type        = bool
  description = "Enable Purge Protection"
}

// variable "public_network_access_enabled" {}

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





