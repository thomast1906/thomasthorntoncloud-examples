resource "azurerm_resource_group" "rg" {
  name     = "tamopsrgkvexample"
  location = "uksouth"
}

resource "azurerm_key_vault" "kv" {
  name                = "tamopskvexample1"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete"
    ]
  }
}

resource "azurerm_key_vault_secret" "sa" {
  name         = "saname1"
  value        = "tamopsstorage1"
  key_vault_id = azurerm_key_vault.kv.id
}

resource "azurerm_storage_account" "sa" {
  name                     = azurerm_key_vault_secret.sa.value
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  depends_on = [
    azurerm_resource_group.rg
  ]
}

data "azurerm_key_vault_secret" "saname2" {
  name         = "saname2"
  key_vault_id = azurerm_key_vault.kv.id
}

resource "azurerm_storage_account" "sa2" {
  name                     = data.azurerm_key_vault_secret.saname2.value
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  depends_on = [
    azurerm_resource_group.rg
  ]
}