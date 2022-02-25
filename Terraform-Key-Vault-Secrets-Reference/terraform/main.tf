# Reference Azure Key Vault
data "azurerm_key_vault" "thomasthorntoncloudkv" {
  name                = "thomasthorntoncloudkv"
  resource_group_name = "thomasthorntoncloud"
}

# Reference Key Vault Secret
data "azurerm_key_vault_secret" "secret1" {
  name         = "secret1"
  key_vault_id = data.azurerm_key_vault.existing.id
}

resource "azurerm_resource_group" "main" {
  name     = data.azurerm_key_vault_secret.secret1.value
  location = "West Europe"
}