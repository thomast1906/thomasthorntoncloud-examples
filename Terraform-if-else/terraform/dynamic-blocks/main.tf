resource "azurerm_resource_group" "rg" {
  name     = "rg-resources"
  location = "Uk South"
}

locals {
  storage_accounts = [
    {
      name        = "thomassa1"
      access_tier = "Hot"
    },
    {
      name        = "thomassa2"
      access_tier = "Cool"
    }
  ]
}

resource "azurerm_storage_account" "example" {
  for_each = { for sa in local.storage_accounts : sa.name => sa }

  name                     = each.value.name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  dynamic "network_rules" {
    for_each = each.value.access_tier == "Hot" ? [1] : []

    content {
      default_action = "Deny"
      ip_rules       = ["23.45.1.0/30"]
    }
  }
}