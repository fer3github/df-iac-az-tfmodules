resource "azurerm_virtual_network" "example" {
  name                = var.vnetname
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.resource_group_name
  dynamic "subnet" {
    for_each = var.subnet_list
    content {
      name           = subnet.value["name"]
      address_prefix = subnet.value["address_prefix"]
      security_group = azurerm_network_security_group.example.id
    }
  }
  tags = var.tags
}

resource "azurerm_network_security_group" "example" {
  name                = var.nsgname
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = var.tags

}
