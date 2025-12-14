# variable "rg_name" {}
# variable "rg_location" {}
variable "module_rg_for_each" {
  type = map(object({
    name     = string
    location = string
  }))
}
