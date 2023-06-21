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
  name       = "tfazlab"

}

data "azurerm_key_vault_secret" "tfazspn-kv-sc" {
  name         = "SPNPass"
  key_vault_id = azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "tfazappid-kv-sc" {
  name         = "tfazAppID"
  key_vault_id = azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "tfazstg-kv-sc" {
  name         = "SASPass"
  key_vault_id = azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "tfaz-tnt-kv-sc" {
  name         = "tenant-id"
  key_vault_id = azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "tfaz-subid-kv-sc" {
  name         = "subscription-id"
  key_vault_id = azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "stgname" {
  name         = "stgname"
  key_vault_id = azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "tfaz-vmp-kv-sc" {
  name         = "VMAdminPass"
  key_vault_id = azurerm_key_vault.kv.id
}