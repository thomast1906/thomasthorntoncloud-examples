provider "azurerm" {
  features {}
  subscription_id = var.deployment_subscription_id
}

terraform {

  backend "azurerm" {
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.7.0"
    }
  }
}