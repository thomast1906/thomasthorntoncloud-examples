output "network_id" {
  value = azurerm_virtual_network.virtual_network.id
}

output "network_name" {
  value = azurerm_virtual_network.virtual_network.name
}

output "network_resource_group" {
  value = azurerm_virtual_network.virtual_network.resource_group_name
}
