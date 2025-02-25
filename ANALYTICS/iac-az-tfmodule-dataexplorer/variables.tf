#Required Variables
variable "resource_group_name" {
  type        = string
  description = "The Resource Group name in which to put the Key Vault"
}

variable "location" {
  description = "Ubicación de los recursos"
}

variable "enable_monitoring" {
  description = "Variable to enable or disable AML compute cluster"
  default     = false
}

variable "tags" {}
variable "name" {}
variable "sku" {}
variable "kusto_database_name" {}