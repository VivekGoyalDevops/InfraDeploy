# variable "nic_name" {}
# variable "nic_location" {}
# variable "nic_rg_name" {}
# variable "pip_name" {}
# variable "subnet_name" {}
# variable "vnet_name" {}
# variable "rg_name" {}
variable "module_nic_for_each" {
  type = map(object({
    nic_name = string
    pip_name = string
  }))
}
variable "subnet_name" {
  type = list(string)
}
variable "vnet_name" {
  type = string
}
variable "rg_name" {
  type = string
}
variable "nic_location" {
  type = string
}
variable "subnet_id" {
  type = list(string)
}
variable "public_ip_id" {
  type = list(string)
}