resource "azurerm_public_ip" "public_ip" {
  for_each = var.module_public_ip
  name                = each.value.name
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = var.allocation_method
}