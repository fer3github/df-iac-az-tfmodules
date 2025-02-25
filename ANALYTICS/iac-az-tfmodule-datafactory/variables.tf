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

variable "data_factory_name" {
  type        = string
  description = "Name of the Data Factory"

  #validation {
  #condition     = can(regex("^kv-[a-zA-Z]+-(?:pro|pre|play)-(?:z|a)-(?:weu|scp)-\\d{3}$", var.kvname))
  # error_message = "The Key Vault name needs to follow the naming convention, e.g.:'kv-myapp-pro-z-weu-001'."
  #}
}

variable "tags" {}





