#Required Variables
variable "resource_group_name" {
  type        = string
  description = "The Resource Group name in which to put the Key Vault"

}

variable "targetvnetid" {
  type        = string
  description = "Name of the remote elz vnet"

}

variable "vnetname" {
  type        = string
  description = "Name of the Dar mahou vnet"

}

variable "peeringname" {
  type = string
}

variable "allow_forwarded_traffic" {
  type    = bool
  default = false
}

variable "allow_gateway_transit" {
  type    = bool
  default = false
}