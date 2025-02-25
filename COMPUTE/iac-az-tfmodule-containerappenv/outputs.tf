output "container_app_environment_id" {
  value = azurerm_container_app_environment.containerappenv.id
}

output "default_domain" {
  value = azurerm_container_app_environment.containerappenv.default_domain
}

output "static_ip_address" {
  value = azurerm_container_app_environment.containerappenv.static_ip_address
}