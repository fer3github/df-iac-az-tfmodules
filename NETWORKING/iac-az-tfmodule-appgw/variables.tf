variable "resource_group_name" {
  type        = string
  description = "(Required) Resource Group Name"
}
variable "location" {
  type        = string
  description = "(Required) Resource Group Location"
}
variable "appgw_config" {}

variable "tags" {
  type = map(string)
}