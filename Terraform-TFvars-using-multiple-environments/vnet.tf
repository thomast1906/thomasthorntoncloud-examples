# Azure Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = "tamops-vnet-${var.environment}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = [var.vnet_address_space]

  subnet {
    name           = var.subnet_name
    address_prefix = var.subnet_address_prefix
  }
}