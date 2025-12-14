# output "nic_name" {
#   value = azurerm_network_interface.nic.name
# }
output "nic_name" {
  value = [for nicName in azurerm_network_interface.nic : nicName.name]
}
output "nic_id"{
  value = [for nic_id in azurerm_network_interface.nic : nic_id.id]
}