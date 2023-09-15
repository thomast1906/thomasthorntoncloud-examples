provider "azurerm" {
  features {}
  subscription_id = var.deployment_subscription_id
}

terraform {
  required_version = ">= 1.1.7"

  backend "azurerm" {
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.7.0"
    }
  }
}