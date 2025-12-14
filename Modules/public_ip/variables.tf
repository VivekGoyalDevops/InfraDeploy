variable "module_public_ip" {
  type = map(object({
    name = string
  }))
}
variable "resource_group_name" {
  type = string
}
variable "location" {
  type = string
}
variable "allocation_method" {
  type = string
}