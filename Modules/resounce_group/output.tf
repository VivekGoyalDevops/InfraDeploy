
# output "rg_name" {
#   value = azurerm_resource_group.rg.name
# }
# output "rg_location" {
#   value = azurerm_resource_group.rg.location
# }

output "todo-rg-names" {
  value = [for rg-name in azurerm_resource_group.rg : rg-name.name]
}
output "todo-rg-location" {
  value = [for rg-location in azurerm_resource_group.rg : rg-location.location]
}