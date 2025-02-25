# outputs.tf

output "result" {
  value = var.tags
}

output "name" {
  value = azurerm_resource_group.mahourg.name
}

output "location" {
  value = azurerm_resource_group.mahourg.location
}