resource "azurerm_resource_group" "tamops-rg" {
  name     = "tamops-resources"
  location = "West Europe"
}

resource "azurerm_key_vault" "tamops-kv" {
  name                       = "tamops-keyvault"
  location                   = azurerm_resource_group.tamops-rg.location
  resource_group_name        = azurerm_resource_group.tamops-rg.name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Create",
      "Get",
    ]

    secret_permissions = [
      "Set",
      "Get",
        "List",
      "Delete",
      "Purge",
      "Recover"
    ]
  }
}

resource "azurerm_key_vault_secret" "tamops-secret" {
  name         = "secret-password"
  value_wo        = "secret-password-value"
  value_wo_version = "3"
  key_vault_id = azurerm_key_vault.tamops-kv.id
}

ephemeral "azurerm_key_vault_secret" "tamops-secret" {
  name         = azurerm_key_vault_secret.tamops-secret.name
  key_vault_id = azurerm_key_vault.tamops-kv.id
}

resource "azurerm_key_vault_secret" "tamops-secret2" {
  name         = "secret-password4"
  value_wo        = ephemeral.azurerm_key_vault_secret.tamops-secret.value
  value_wo_version = "1"
  key_vault_id = azurerm_key_vault.tamops-kv.id
}


resource "azurerm_key_vault_secret" "tamops-secret" {
  name         = "secret-password"
  value        = "secret-password-value"
  key_vault_id = azurerm_key_vault.tamops-kv.id
}
