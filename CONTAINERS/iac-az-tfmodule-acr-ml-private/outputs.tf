# outputs.tf

output "acr_id" {
  value = azurerm_container_registry.azure-acr.id
}

# output "acr_admin_username" {
#   value = azurerm_container_registry.example.admin_username
# }

# output "acr_admin_password" {
#   value = azurerm_container_registry.example.admin_password
# }

# output "acr_resource_group_name" {
#   value = azurerm_resource_group.example.name
# }