data "azurerm_client_config" "current" {}
resource "random_string" "suffix" {
  length  = 6
  special = false
}
resource "azurerm_key_vault" "kv" {
  for_each = var.module_key_vault
  name                       = "${each.value.name}-${random_string.suffix.result}"
  location                   = var.location
  resource_group_name        = var.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = each.value.sku
  soft_delete_retention_days = each.value.soft_delete_retention_days
  purge_protection_enabled    = false
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Backup",
      "Delete",
      "Get",
      "List",
      "Purge",
      "Recover",
      "Restore",
      "Set"
    ]

    storage_permissions = [
      "Get",
    ]
  }
}

