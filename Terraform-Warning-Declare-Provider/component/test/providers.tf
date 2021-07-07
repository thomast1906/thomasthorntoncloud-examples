terraform {
  required_version = ">= 0.13.0"

  backend "local" {}
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.58.0"
    }
  }
}
provider "azurerm" {
  features {}
  skip_provider_registration = true
}

provider "azurerm" {
  alias = "storageaccount_nonprod"
  features {}
  subscription_id = "XXXXX-XXXXX-XXXXX-XXXXX-XXXXX"
}