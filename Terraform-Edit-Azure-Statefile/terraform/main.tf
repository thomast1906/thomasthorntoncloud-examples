provider "azurerm" {
  features {}
}

terraform {
    backend "azurerm" {
    }
}

# Create Resource Group
resource "azurerm_resource_group" "tamops-rg" {
  name     = "tamops-rg"
  location = "UK South"
}

# Create Storage Account
resource "azurerm_storage_account" "tamops-sa" {
  name                = "tamopssa"
  resource_group_name = azurerm_resource_group.tamops-rg.name

  location                 = azurerm_resource_group.tamops-rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

}

# Create Storage Account2
resource "azurerm_storage_account" "tamops-sa2" {
  name                = "tamopssa2"
  resource_group_name = azurerm_resource_group.tamops-rg.name

  location                 = azurerm_resource_group.tamops-rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

}

# Create Storage Account3
resource "azurerm_storage_account" "tamops-sa-newname" {
  name                = "tamopssa3"
  resource_group_name = azurerm_resource_group.tamops-rg.name

  location                 = azurerm_resource_group.tamops-rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

}