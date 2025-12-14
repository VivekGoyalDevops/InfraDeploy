variable "module_vm_for_each" {
    type = map(object({
      name = string 
    }))
  } 
  variable "size" {
    type = string
  }
  variable "admin_username" {
    type = list(string)
  }
    variable "admin_password" {
    type = list(string)
  }
    variable "disable_password_authentication" {
    type = bool
  }
    variable "caching" {
    type = string
  }
    variable "storage_account_type" {
    type = string
  }
    variable "publisher" {
    type = string
  }
    variable "offer" {
    type = string
  }
    variable "sku" {
    type = string
  }

  variable "nic_name" {
  type = list(string)
}
variable "resource_group_name" {
  type = list(string)
}
variable "location" {
  type = list(string)
}
variable "nic_id" {
  type = list(string)
}