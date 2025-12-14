
resource "azurerm_virtual_network" "vnet" {
  for_each = var.module_vnet_for_each
  name                = each.value.name
  address_space       = each.value.address_space
  location            = var.location
  resource_group_name = var.resource_group_name
}