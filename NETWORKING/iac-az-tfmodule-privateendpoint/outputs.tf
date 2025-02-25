output "staticip" {
  value = azurerm_private_endpoint.example.private_service_connection[0].private_ip_address
}