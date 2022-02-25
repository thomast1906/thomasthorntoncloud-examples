provider "azurerm" {
    version = "~> 2.0"
    features {}
}

terraform {
    backend "azurerm" {
      # resource_group_name = "thomasthorntoncloud"   
      # storage_account_name = "thomasthorntontfstate"
      # container_name = "aksdeployazuredevops"
    }
}