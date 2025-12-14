resource "azurerm_resource_group" "rg" {
  for_each = var.module_rg_for_each
  name     = each.value.name
  location = each.value.location
}