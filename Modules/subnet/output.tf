# output "subnet_name" {
#   value = azurerm_subnet.subnet.name
# }
output "subnet_name" {
  value = [for subnet-name in azurerm_subnet.subnet : subnet-name.name]
}
output "subnet_id" {
  value = [for subnet-id in azurerm_subnet.subnet : subnet-id.id]
}