resource "azurerm_mssql_server" "sqlserver" {
  for_each = var.module_mssql_server
  name                         = each.value.name
  resource_group_name          = var.resource_group_name[0]
  location                     = var.location[0]
  version                      = each.value.version
  administrator_login          = var.administrator_login[1]
  administrator_login_password = var.administrator_login_password[1]
  minimum_tls_version          = each.value.minimum_tls_version
}