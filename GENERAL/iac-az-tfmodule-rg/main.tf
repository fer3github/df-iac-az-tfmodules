# main.tf

# Create a Azure Container Registry
resource "azurerm_resource_group" "mahourg" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}