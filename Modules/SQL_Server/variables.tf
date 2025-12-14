variable "module_mssql_server" {
    type = map(object({
    name                         = string
    version                      = string
    minimum_tls_version          = string 
  }))
}
variable "resource_group_name" {
  type = list(string)
}
variable "location" {
  type = list(string)
}
variable "administrator_login" {
  type = list(string)
}
variable "administrator_login_password" {
  type = list(string)
}