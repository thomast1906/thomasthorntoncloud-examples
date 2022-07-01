resource "azurerm_resource_group" "example" {
  name     = "tam-media-resources"
  location = "West Europe"
}

resource "azurerm_storage_account" "example" {
  name                     = "examplestoracctam"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_media_services_account" "example" {
  name                = "examplemediaacctam"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  storage_account {
    id         = azurerm_storage_account.example.id
    is_primary = true
  }
}

resource "azapi_update_resource" "test" {
  type        = "Microsoft.Media/mediaservices@2021-06-01"
  resource_id = azurerm_media_services_account.example.id

  body = jsonencode({
    properties = {
      storageAuthentication = "ManagedIdentity"
      storageAccounts = [
        {
          id   = azurerm_storage_account.example.id
          
          type = "Primary"
          identity = {
            userAssignedIdentity      = azurerm_user_assigned_identity.example.id
            useSystemAssignedIdentity = "false"
          }
        }
      ]
    }
  })
}

resource "azurerm_user_assigned_identity" "example" {
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  name = "tam-identity"
}

