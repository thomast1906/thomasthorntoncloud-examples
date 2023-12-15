provider "azurerm" {
  version = "~> 3.0"
  features {}
}

terraform {
  backend "azurerm" {
  }
}