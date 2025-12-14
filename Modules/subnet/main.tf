resource "azurerm_subnet" "subnet" {
  # name                 = var.subnet_name
  # resource_group_name  = var.subnet_rg_name
  # virtual_network_name = var.subnet_vnet_name
  # address_prefixes     = var.subnet_address_prefix
  for_each = var.module_subnet_for_each
  name                 = each.value.name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = each.value.address_prefixes
}
