#Required variables
variable "resource_group_name" {
  type        = string
  description = "The Resource Group name in which to put the Storage Accounts."
}

variable "location" {
  type        = string
  description = "The Resource Group location in which to put the Storage Accounts."
}

variable "cross_tenant_replication_enabled" {
  type    = string
  default = "true"
}

#Optional variables
variable "storage_account_name" {
  type        = string
  description = "Storage Account name to create."
  default     = ""
}

variable "storage_account_tier" {
  type        = string
  description = "The Storage Account tier, either 'Standard' or 'Premium'."
  default     = "Standard"
}

variable "storage_account_replication_type" {
  type        = string
  description = "The type of replication to use for this Storage Account. Valid options are LRS, GRS, RAGRS and ZRS"
  default     = "LRS"
}

variable "is_hns_enabled" {
  type    = bool
  default = false
}

variable "public_network_access_enabled" {
  type = bool
}

variable "tags" {
  type = map(string)
}
variable "allow_nested_items_to_be_public" {
  description = "Allow blob anonymous access"
  type        = bool
  default     = true
}







