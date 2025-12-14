# output "vnet_name" {
#   value = azurerm_virtual_network.vnet.name
# }
output "todo_vnet_name" {
  value = [for vnet-name in azurerm_virtual_network.vnet : vnet-name.name]
}