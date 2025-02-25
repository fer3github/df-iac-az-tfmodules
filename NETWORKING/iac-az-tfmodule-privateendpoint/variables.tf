variable "location" {}
variable "resource_group_name" {}
variable "connected_resource_id" {}
variable "subnet_id" {}
variable "pe_config" {
  type = object({
    connection_name         = string
    name                    = string
    connection_subresources = list(string)
    is_manual_connection    = bool
  })
}
variable "dns_name" {}

variable "dns_zone" {}
variable "tags" {}