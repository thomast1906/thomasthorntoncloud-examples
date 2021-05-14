# Create Resource Group
resource "azurerm_resource_group" "tamops" {
  name     = "tamops"
  location = "eastus2"
}

# Create Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = "tamops-vnet"
  address_space       = ["192.168.0.0/16"]
  location            = "eastus2"
  resource_group_name = azurerm_resource_group.tamops.name
}

# Create Subnet 1
resource "azurerm_subnet" "subnet1" {
  name                 = "subnet1"
  resource_group_name  = azurerm_resource_group.tamops.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefix       = "192.168.1.0/24"
}
