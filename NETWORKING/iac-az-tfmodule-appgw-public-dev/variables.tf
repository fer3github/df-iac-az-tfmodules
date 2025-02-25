variable "resource_group_name" {
  type        = string
  description = "(Required) Resource Group Name"
}
variable "location" {
  type        = string
  description = "(Required) Resource Group Location"
}
variable "appgw_config" {}

variable "firewall_policy_id" {
  type        = string
  description = "(Required) firewall policy id"
}

variable "tags" {
  type = map(string)
}