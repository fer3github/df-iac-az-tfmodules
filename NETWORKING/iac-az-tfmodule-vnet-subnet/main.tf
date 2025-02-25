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

  subnet {
    name           = var.subnetappgw.subnetname
    address_prefix = var.subnetappgw.address_prefix
    security_group = azurerm_network_security_group.appgw.id
  }

  tags = var.tags
}

resource "azurerm_network_security_group" "example" {
  name                = var.nsgname
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = var.tags

}

resource "azurerm_network_security_group" "appgw" {
  name                = "${var.nsgname}-appgw"
  location            = var.location
  resource_group_name = var.resource_group_name

  dynamic "security_rule" {
    for_each = var.security_rules
    content {
      name                       = security_rule.value["name"]
      priority                   = security_rule.value["priority"]
      direction                  = security_rule.value["direction"]
      access                     = security_rule.value["access"]
      protocol                   = security_rule.value["protocol"]
      source_port_range          = security_rule.value["source_port_range"]
      destination_port_ranges    = security_rule.value["destination_port_ranges"]
      source_address_prefix      = security_rule.value["source_address_prefix"]
      destination_address_prefix = security_rule.value["destination_address_prefix"]
    }

  }

  tags = var.tags

}