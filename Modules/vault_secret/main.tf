resource "azurerm_key_vault_secret" "secret" {
  for_each = var.module_vault_secret
  name         = each.value.name
  value        = each.value.value
  # key_vault_id = var.key_vault_id[index(keys(var.module_vault_secret),each.key)]
  key_vault_id = var.key_vault_id[0]
}