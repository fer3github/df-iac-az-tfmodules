resource "azurerm_data_factory" "example" {
  name                = var.data_factory_name
  location            = var.location
  resource_group_name = var.resource_group_name
  identity {
    type = "SystemAssigned"
  }
  tags = var.tags
}


