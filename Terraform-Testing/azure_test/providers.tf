terraform {
  backend "local" {
  }
}


provider "azurerm" {
  features {}
  subscription_id = "04109105-f3ca-44ac-a3a7-66b4936112c3"
}