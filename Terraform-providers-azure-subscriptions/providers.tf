# default provider
provider "azurerm" {
  subscription_id = "04109105-f3ca-44ac-a3a7-66b4936112c3"
  features {}
}

provider "azurerm" {
  subscription_id = "04109105-f3ca-44ac-a3a7-66b4936112c4"
  features {}
  alias = "subscription_2"
}


provider "azurerm" {
  subscription_id = "04109105-f3ca-44ac-a3a7-66b4936112c5"
  features {}
  alias = "subscription_3"
}