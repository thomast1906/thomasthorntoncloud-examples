# Create Virtual Network
resource "azurerm_virtual_network" "ado_agent_vnet" {
  name                = var.vnet_name
  address_space       = var.vnet_ip_address
  location            = var.location
  resource_group_name = azurerm_resource_group.tamops.name
}

# Create Subnet
resource "azurerm_subnet" "subnet_name_ado_agent" {
  name                 = var.subnet_name_ado_agent
  resource_group_name  = azurerm_resource_group.tamops.name
  virtual_network_name = azurerm_virtual_network.ado_agent_vnet.name
  address_prefix       = var.subnet_name_ado_agent_address
}