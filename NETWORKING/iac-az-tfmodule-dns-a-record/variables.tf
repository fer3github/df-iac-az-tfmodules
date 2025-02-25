#Required Variables
variable "resource_group_name" {
  type        = string
  description = "The Resource Group name in which to put the Key Vault"
}

variable "dns_a_record_name" {
  type        = string
  description = "Name of the DNS subdomain"
}

variable "dns_a_record_ip_list" {
  type        = list(string)
  description = "Name list of the DNS Ip"

}
variable "dns_zone_name" {
  type        = string
  description = "Name of the DNS Ip"

}