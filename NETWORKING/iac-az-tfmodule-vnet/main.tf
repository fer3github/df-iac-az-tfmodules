resource "azurerm_virtual_network" "example" {
  name                = var.vnetname
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = var.tags
}

resource "azurerm_network_security_group" "example" {
  name                = var.nsgname
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = var.tags

}