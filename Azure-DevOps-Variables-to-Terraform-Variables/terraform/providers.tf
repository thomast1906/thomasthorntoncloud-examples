provider "azurerm" {
  version = "~> 3.0"
  features {}
}

terraform {
  backend "azurerm" {
  }
}

data "azurerm_client_config" "current" {}