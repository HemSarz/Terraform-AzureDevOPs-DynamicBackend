output "appid_tfazsp" {
  value     = data.azuread_application.tfazsp.application_id
  sensitive = true
}

output "pass_tfazsp" {
  value     = azuread_application_password.tfazsp.value
  sensitive = true
}

output "stg_SASPass" {
  value     = data.azurerm_storage_account.stg.primary_access_key
  sensitive = true
}