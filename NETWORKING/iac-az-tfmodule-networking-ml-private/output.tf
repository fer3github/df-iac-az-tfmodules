output "virtual_network_name" {
  value = azurerm_virtual_network.default.name
}

# output "azurerm_subnet_workspace_id" {
#   value = azurerm_subnet.snet-workspace.id
# }

# output "azurerm_subnet_training_id" {
#   value = azurerm_subnet.snet-training.id
# }

output "azurerm_subnet_training_id" {
  value = azapi_resource.subnet_training.id
}

output "azurerm_subnet_workspace_id" {
  value = azapi_resource.subnet_workspace.id
}

# output "azurerm_subnet_training_id" {
#   value = azurerm_virtual_network.default.subnet["snet-training"].id
# }

# output "azurerm_subnet_workspace_id" {
#   value = azurerm_virtual_network.default.subnet["snet-workspace"].id
# }