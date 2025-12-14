variable "module_database" {
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
variable "server_id" {
  type = list(string)
}