variable "acr_name" {
  type        = string
  description = "(Required) ACR Name"
}
variable "resource_group_name" {
  type        = string
  description = "(Required) Resource Group Name"
}
variable "location" {
  type        = string
  description = "(Required) Resource Group Location"
}
variable "acr_admin" {
  type        = bool
  description = "(Required) Enables acr admin user"
}
variable "acr_sku" {
  type        = string
  description = "(Required) Sku of the ACR"
}
variable "public_network_access_enabled" {
  type        = bool
  description = "(Required) Enable public access to ACR"
}
variable "tags" {
  type = map(string)
}
