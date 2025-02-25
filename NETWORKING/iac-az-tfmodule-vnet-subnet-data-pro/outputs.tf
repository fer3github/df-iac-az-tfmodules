output "virtual_network_name" {
  value = azurerm_virtual_network.example.name
}

output "virtual_network_id" {
  value = azurerm_virtual_network.example.id
}

output "nsg_id" {
  value = azurerm_network_security_group.example.id
}

output "subnet_id" {
  value = [for s in azurerm_virtual_network.example.subnet : s.id if s.name == var.subnet_list[0].name][0]
}