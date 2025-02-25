resource "azurerm_private_dns_zone" "example" {
  name                = var.dnszonename
  resource_group_name = var.resource_group_name

  tags = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "example" {
  count                 = length(var.vnet_ids)
  name                  = var.dnsvnetlinknames[count.index]
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = var.dnszonename
  virtual_network_id    = var.vnet_ids[count.index]

  tags       = var.tags
  depends_on = [azurerm_private_dns_zone.example]
}

