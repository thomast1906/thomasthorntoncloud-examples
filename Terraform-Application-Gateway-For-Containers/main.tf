provider "azurerm" {
  features {}
}

# create resource group
resource "azurerm_resource_group" "rg" {
  name     = "tamops-rg-example"
  location = "uksouth"
}

# create vnet
resource "azurerm_virtual_network" "virtual_network" {
  name = "tamops-vnet"
  location = "uksouth"
  resource_group_name = azurerm_resource_group.rg.name
  address_space = ["192.168.0.0/16"]

}

# create subnet for Application Gateway for Containers
resource "azurerm_subnet" "appgw_subnet" {
  name = "agfcsubnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes = ["192.168.0.0/24"]

  delegation {
    name = "delegation"

    service_delegation {
      name    = "Microsoft.ServiceNetworking/trafficControllers"
    }
  }
}

# create network security group & associate with subnet
resource "azurerm_network_security_group" "nsg" {
  name                = "tamops-nsg"
  location            = "uksouth"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet_network_security_group_association" "app_gwsubnet" {
  subnet_id                 = azurerm_subnet.appgw_subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

# Azure Application Gateway for Containers
resource "azurerm_application_load_balancer" "alb" {
  name                = "tamops-alb"
  location            = "uksouth"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_application_load_balancer_subnet_association" "alb" {
  name                         = "alb-subnet-association"
  application_load_balancer_id = azurerm_application_load_balancer.alb.id
  subnet_id                    = azurerm_subnet.appgw_subnet.id
}

resource "azurerm_application_load_balancer_frontend" "alb" {
  name                         = "alb-frontend"
  application_load_balancer_id = azurerm_application_load_balancer.alb.id
}