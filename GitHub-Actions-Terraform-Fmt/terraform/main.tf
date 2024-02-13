resource "azurerm_resource_group" "example" {
  name     = "thomasthorntoncloud-rg-terraform-fmt"
  location = "UK South"
}

resource "azurerm_virtual_network" "example" {
  name                = "my-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}
