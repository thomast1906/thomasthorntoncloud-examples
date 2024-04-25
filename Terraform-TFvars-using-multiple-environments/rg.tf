# Azure Provider
provider "azurerm" {
  features {}
}

# Azure Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "tamops-rg-${var.environment}"
  location = var.location
}