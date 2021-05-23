# Create Random Password
resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "_%@"
}

# Create Key Vault
resource "azurerm_key_vault" "keyvault_ado_agent" {
  name                        = var.key_vault_name
  location                    = azurerm_resource_group.tamops.location
  resource_group_name         = azurerm_resource_group.tamops.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    secret_permissions = [
      "Get", "Set", "List"
    ]
  }
}

resource "azurerm_key_vault_secret" "keyvault_ado_agent_secret" {
  name         = "thomasthorntoncloud-ado-agent-password-2"
  value        = random_password.password.result
  key_vault_id = azurerm_key_vault.keyvault_ado_agent.id
}