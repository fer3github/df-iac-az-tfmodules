# outputs.tf

# output "result" {
#   value = var.tags
# }

output "id" {
  value = azurerm_storage_share.myfileshare.id
}

# output "location" {
#   value = azurerm_resource_group.mahourg.location
# }