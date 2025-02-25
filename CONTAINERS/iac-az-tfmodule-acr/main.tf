# main.tf
# format("%sregistry", lower(replace(var.name, "/[[:^alnum:]]/", "")))

# Create a Azure Container Registry
resource "azurerm_container_registry" "azure-acr" {
  name                          = var.acr_name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  sku                           = var.acr_sku
  admin_enabled                 = var.acr_admin
  public_network_access_enabled = var.acr_public_network_access_enabled
  tags                          = var.tags
}