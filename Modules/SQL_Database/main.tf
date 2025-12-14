resource "azurerm_mssql_database" "db" {
  for_each = var.module_database
  name           = each.value.name
  server_id      = var.server_id[0]
  collation      = each.value.collation
  license_type   = each.value.license_type
  max_size_gb    = each.value.max_size_gb
  sku_name       = each.value.sku_name
  enclave_type   = each.value.enclave_type
}