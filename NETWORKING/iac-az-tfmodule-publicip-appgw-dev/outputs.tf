output "publicip_id" {
  value = azurerm_public_ip.public-ip.id
}

output "publicip_ipaddress" {
  value = azurerm_public_ip.public-ip.ip_address
}