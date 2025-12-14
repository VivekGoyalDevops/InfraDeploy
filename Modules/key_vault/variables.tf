variable "module_key_vault" {
  type = map(object({
    name                       = string
    sku                        = string
    soft_delete_retention_days = number
  }))
}
variable "location" {
   type = string
}
variable "resource_group_name" {
  type = string
}

