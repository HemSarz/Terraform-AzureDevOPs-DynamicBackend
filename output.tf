#### hawaVB

output "tfazhh" {
  value     = data.azuread_service_principal.tfazspn.application_id
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

#### infraVB

output "RGName" {
  value     = azurerm_resource_group.rg_name.name
  sensitive = true
}

output "STGName" {
  value     = azurerm_storage_account.stg.name
  sensitive = true
}

output "ContName" {
  value     = azurerm_storage_container.cont.name
  sensitive = true
}