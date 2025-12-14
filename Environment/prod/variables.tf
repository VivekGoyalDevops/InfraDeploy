variable "infra_rg_for_each" {
  type = map(object({
    name     = string
    location = string
  }))
}
variable "infra_vnet_for_each" {
  type = map(object({
    name          = string
    address_space = list(string)
  }))
}
variable "infra_subnet_for_each" {
  type = map(object({
    name             = string
    address_prefixes = list(string)
  }))
}
variable "infra_nic_for_each" {
  type = map(object({
    nic_name = string
    pip_name = string
  }))
}

variable "infra_vm_for_each" {
  type = map(object({
    name = string
  }))
}
variable "infra_public_ip" {
  type = map(object({
    name = string
  }))
}
variable "infra_key_vault" {
  type = map(object({
    name                       = string
    sku                        = string
    soft_delete_retention_days = number
  }))
}
variable "infra_vault_secret" {
  type = map(object({
    name  = string
    value = string
  }))
}
variable "infra_mssql_server" {
  type = map(object({
    name                = string
    version             = string
    minimum_tls_version = string
  }))
}
variable "infra_database" {
  type = map(object({
    name         = string
    version      = string
    collation    = string
    license_type = string
    max_size_gb  = number
    sku_name     = string
    enclave_type = string
  }))
}
