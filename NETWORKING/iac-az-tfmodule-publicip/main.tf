# Create a Public IP
resource "azurerm_public_ip" "public-ip" {
  name                = var.publicipname
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = var.allocation_method
  sku                 = var.sku
  zones               = var.zones
  tags                = var.tags
}