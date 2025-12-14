# variable "subnet_name" {}
# variable "subnet_rg_name" {}
# variable "subnet_vnet_name" {}
# variable "subnet_address_prefix" {}

variable "module_subnet_for_each" {
  type = map(object({
    name             = string
    address_prefixes = list(string)
  }))
}
variable "resource_group_name" {
  type = string
}
variable "virtual_network_name" {
  type = string
}
