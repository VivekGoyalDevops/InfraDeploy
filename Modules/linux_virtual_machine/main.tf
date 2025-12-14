
# data "azurerm_network_interface" "nic" {
#   name                = var.nic_name[0]
#   resource_group_name = var.resource_group_name[0]
# }

resource "azurerm_linux_virtual_machine" "vm" {
  for_each = var.module_vm_for_each
  name                = each.value.name
  resource_group_name = var.resource_group_name[0]
  location            = var.location[0]
  size                = var.size
  admin_username      = var.admin_username[0]
  admin_password      = var.admin_password[0]
  disable_password_authentication = var.disable_password_authentication
  network_interface_ids = [
    var.nic_id[index(keys(var.module_vm_for_each),each.key)],
  ]
  os_disk {
    caching              = var.caching
    storage_account_type = var.storage_account_type
  }

  source_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = "latest"
  }
}            