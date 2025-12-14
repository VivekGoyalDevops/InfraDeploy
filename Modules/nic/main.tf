# data "azurerm_subnet" "subnet" {
#   name                 = var.subnet_name
#   virtual_network_name = var.vnet_name
#   resource_group_name  = var.rg_name
# }
resource "azurerm_network_interface" "nic" {
  for_each            = var.module_nic_for_each
  name                = each.value.nic_name
  location            = var.nic_location
  resource_group_name = var.rg_name

  ip_configuration {
      name                          = each.value.pip_name
      subnet_id                     = var.subnet_id[index(keys(var.module_nic_for_each),each.key)]
      private_ip_address_allocation = "Dynamic"
      public_ip_address_id = var.public_ip_id[index(keys(var.module_nic_for_each),each.key)]
  }
}
