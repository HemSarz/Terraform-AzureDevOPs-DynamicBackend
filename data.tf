data "azurerm_client_config" "current" {}
data "azuread_client_config" "current" {}

data "azurerm_storage_account" "stg" {
  name                = azurerm_storage_account.stg.name
  resource_group_name = azurerm_resource_group.rg_name.name
  depends_on          = [azurerm_storage_account.stg]
}

data "azuread_application" "tfazsp" {
  display_name = "tfazhh"

  depends_on = [azuread_application.tfazsp]
}

data "azuredevops_project" "tfazlab" {
  name = "tfazlab"
}

data "azuredevops_git_repository" "tfazrepo" {
  project_id = data.azuredevops_project.tfazlab.project_id
  name       = "tfazlabro"
}