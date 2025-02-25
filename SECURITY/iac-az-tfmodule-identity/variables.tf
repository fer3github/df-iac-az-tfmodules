#Required Variables
variable "location" {
  description = "Ubicación del clúster AKS"
}

variable "resource_group_name" {
  type        = string
  description = "resource_group"
}

variable "identityname" {
  type = string
}

variable "private_dns_zone_id" {
  type = string
}

variable "vnet_id" {
  type = string
}

variable "tags" {
  type = map(string)
}