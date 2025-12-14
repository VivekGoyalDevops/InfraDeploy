output "secret_name" {
  value = [for username in azurerm_key_vault_secret.secret : username.name]
}

output "secret_password" {
  value = [for password in azurerm_key_vault_secret.secret : password.value]
}