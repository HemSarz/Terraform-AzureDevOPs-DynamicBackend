output "tfazhh" {
  value     = data.azuread_application.tfazsp.application_id
  sensitive = true
}

output "SPNPass" {
  value     = azuread_application_password.tfazsp.value
  sensitive = true
}

output "STGPass" {
  value     = data.azurerm_storage_account.stg.primary_access_key
  sensitive = true
}

output "project_id" {
  value = data.azuredevops_project.tfazlab.project_id
}