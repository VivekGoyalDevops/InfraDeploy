module "resource_group" {
  # source = "../../Modules/resounce_group"
  # rg_name = "practice_rg"
  # rg_location = "centralindia"
  source             = "../../Modules/resounce_group"
  module_rg_for_each = var.infra_rg_for_each
}
module "virtual_network" {
  #  source = "../../Modules/virtual_network"
  #  vnet_name = "vnet1"
  #  vnet_address_space = ["10.0.0.0/16"]  
  #  vnet_location = module.resource_group.todo-rg-location
  #  vnet_rg_name = module.resource_group.todo-rg-names
  source               = "../../Modules/virtual_network"
  module_vnet_for_each = var.infra_vnet_for_each
  location             = module.resource_group.todo-rg-location[0]
  resource_group_name  = module.resource_group.todo-rg-names[0]
}
module "subnet" {
  # source = "../../Modules/subnet"
  # subnet_name = "subnet1"
  # subnet_rg_name = module.resource_group.rg_name
  # subnet_vnet_name = module.virtual_network.vnet_name
  # subnet_address_prefix = ["10.0.1.0/24"]
  source                 = "../../Modules/subnet"
  module_subnet_for_each = var.infra_subnet_for_each
  resource_group_name    = module.resource_group.todo-rg-names[0]
  virtual_network_name   = module.virtual_network.todo_vnet_name[0]
}
module "nic" {
  #   depends_on = [ module.subnet ]
  #   source = "../../Modules/nic"
  #   subnet_name = module.subnet.subnet_name
  #   vnet_name = module.virtual_network.vnet_name
  #   rg_name = module.resource_group.rg_name
  #   nic_name = "nic1"
  #   nic_location = module.resource_group.rg_location
  #   nic_rg_name = module.resource_group.rg_name
  #   pip_name = "pip1"
  source              = "../../Modules/nic"
  module_nic_for_each = var.infra_nic_for_each
  subnet_name         = module.subnet.subnet_name
  vnet_name           = module.virtual_network.todo_vnet_name[0]
  rg_name             = module.resource_group.todo-rg-names[0]
  nic_location        = module.resource_group.todo-rg-location[0]
  subnet_id           = module.subnet.subnet_id
  public_ip_id        = module.pips.public_ip_id
}
module "vms" {
  #   depends_on = [ module.nic ]
  #   source = "../../Modules/linux_virtual_machine"
  #   vm_nic_name = module.nic.nic_name
  #   vm_rg_name = module.resource_group.rg_name
  #   vm_name = "vm1"
  #   vm_location = module.resource_group.rg_location

  source                          = "../../Modules/linux_virtual_machine"
  module_vm_for_each              = var.infra_vm_for_each
  size                            = "Standard_F2"
  admin_username                  = module.vault_secret.secret_name
  admin_password                  = module.vault_secret.secret_password
  disable_password_authentication = false
  caching                         = "ReadWrite"
  storage_account_type            = "Standard_LRS"
  publisher                       = "Canonical"
  offer                           = "0001-com-ubuntu-server-jammy"
  sku                             = "22_04-lts"
  nic_name = module.nic.nic_name
  resource_group_name    = module.resource_group.todo-rg-names
  location = module.resource_group.todo-rg-location
  nic_id = module.nic.nic_id
  
}
module "pips" {
  source = "../../Modules/public_ip"
  module_public_ip = var.infra_public_ip
  resource_group_name = module.resource_group.todo-rg-names[0]
  location = module.resource_group.todo-rg-location[0]
  allocation_method = "Static"
}
module "key_vault" {
  source = "../../Modules/key_vault"
  module_key_vault = var.infra_key_vault
  location = module.resource_group.todo-rg-location[0]
  resource_group_name = module.resource_group.todo-rg-names[0]
}
module "vault_secret" {
  source = "../../Modules/vault_secret"
  module_vault_secret = var.infra_vault_secret
  key_vault_id = module.key_vault.key_vault_id
}

module "sql_server" {
  source = "../../Modules/SQL_Server"
  module_mssql_server = var.infra_mssql_server
  resource_group_name = module.resource_group.todo-rg-names
  location = module.resource_group.todo-rg-location
  administrator_login = module.vault_secret.secret_name
  administrator_login_password =  module.vault_secret.secret_password
}
module "database" {
  source = "../../Modules/SQL_Database"
  module_database = var.infra_database
  server_id = module.sql_server.server_id
}