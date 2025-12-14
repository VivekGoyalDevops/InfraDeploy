# variable "vnet_name" {}
# variable "vnet_address_space" {}
# variable "vnet_location" {}
# variable "vnet_rg_name" {}

variable "module_vnet_for_each" {
  type = map(object({
    name                = string
    address_space       = list(string)
  }))
}
variable "resource_group_name" {
 type = string
}
variable "location" {
  type = string
}