output "server_id" {
  value = [for server-id in azurerm_mssql_server.sqlserver : server-id.id]
}