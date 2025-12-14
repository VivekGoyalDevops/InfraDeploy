output "key_vault_id" {
  value = [for key-vault-id in azurerm_key_vault.kv : key-vault-id.id]
}