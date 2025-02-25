#Required Variables
variable "name" {}
variable "application_type" {}
variable "resource_group_name" {
  type        = string
  description = "The Resource Group name in which to put the Key Vault"
}

variable "location" {
  description = "Ubicación de los recursos"
}

variable "tags" {}





