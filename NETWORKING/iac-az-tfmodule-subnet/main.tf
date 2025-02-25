resource "azurerm_subnet" "example" {
  name                 = var.subnetname
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnetname
  address_prefixes     = var.address_prefixes
  service_endpoints    = var.service_endpoints
}