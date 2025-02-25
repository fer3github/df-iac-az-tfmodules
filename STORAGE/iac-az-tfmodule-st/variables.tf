#Required variables
variable "resource_group_name" {
  type        = string
  description = "The Resource Group name in which to put the Storage Accounts."
}

variable "location" {
  type        = string
  description = "The Resource Group location in which to put the Storage Accounts."
}

variable "is_ml" {
  type        = bool
  description = "Determines if it should create the default container for datastorage."
  default     = false
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
  type    = bool
  default = true
}

variable "tags" {
  type = map(string)
}







