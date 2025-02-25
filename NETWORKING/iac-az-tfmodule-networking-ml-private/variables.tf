#Required Variables
variable "resource_group_name" {
  type        = string
  description = "The Resource Group name in which to put the Key Vault"
}

variable "location" {
  description = "Ubicación de la VNET"
}

variable "vnet_config" {
}

variable "vnetname" {
  description = "Nombre de la VNET"
  type        = string
}

variable "tags" {
  type = map(string)
}

variable "nsgname" {
  type = string
}
