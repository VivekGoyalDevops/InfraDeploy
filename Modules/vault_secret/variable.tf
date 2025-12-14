variable "module_vault_secret" {
  type = map(object({
    name = string
    value = string
  }))
}
variable "key_vault_id" {
  type = list(string)
}