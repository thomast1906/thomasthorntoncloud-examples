data "azurerm_client_config" "current" {}

terraform {
  backend "azurerm" {
    resource_group_name  = "thomasthornton-tfstate"
    storage_account_name = "thomasthorntontfstate"
    container_name       = "tfstate"
    key                  = "develop.tfstate"
  }
}

# Create Resource Group
resource "azurerm_resource_group" "tamops" {
  name     = var.resource_group_name
  location = var.location
}

# Create Storage Account
resource "azurerm_storage_account" "example" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.tamops.name
  location                 = azurerm_resource_group.tamops.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = local.environment
  }
}