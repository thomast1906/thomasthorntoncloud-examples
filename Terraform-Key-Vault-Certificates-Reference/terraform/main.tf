# Reference Azure Key Vault
data "azurerm_key_vault" "tamopskv" {
  name                = "tamopskv"
  resource_group_name = "tamopsrg"
}

# Reference Key Vault certificate
data "azurerm_key_vault_certificate" "certificate" {
  name         = "thomasthorntoncertificate"
  key_vault_id = data.azurerm_key_vault.tamopskv.id
}

# Example to show output of certificate thumbprint
output "certificate_thumbprint" {
  value = data.azurerm_key_vault_certificate.certificate.thumbprint
}