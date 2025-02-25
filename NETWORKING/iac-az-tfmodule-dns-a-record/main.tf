resource "azurerm_private_dns_a_record" "example" {
  provider            = azurerm
  name                = var.dns_a_record_name
  zone_name           = var.dns_zone_name
  resource_group_name = var.resource_group_name
  ttl                 = 300
  records             = var.dns_a_record_ip_list
}