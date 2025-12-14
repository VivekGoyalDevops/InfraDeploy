output "public_ip_id" {
  value = [for pip-id in azurerm_public_ip.public_ip : pip-id.id]
}