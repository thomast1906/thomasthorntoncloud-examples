resource "azurerm_resource_group" "tamops1" {
  name     = "resource-group-sub1"
  location = "uksouth"
}

resource "azurerm_resource_group" "tamops2" {
  name     = "resource-group-sub2"
  location = "uksouth"

  provider = azurerm.subscription_2
}

resource "azurerm_resource_group" "tamops3" {
  name     = "resource-group-sub3"
  location = "uksouth"

  provider = azurerm.subscription_3
}