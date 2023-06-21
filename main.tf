############ Azure ############

############ ResourceGroup ############

resource "azurerm_resource_group" "rg_name" {
  name     = var.rg_name
  location = var.location
}

############ Storage Account ############

resource "azurerm_storage_account" "stg" {
  name                     = var.storageAccount_name
  resource_group_name      = azurerm_resource_group.rg_name.name
  location                 = azurerm_resource_group.rg_name.location
  depends_on               = [azurerm_resource_group.rg_name]
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

#### Storage Container #####

resource "azurerm_storage_container" "cont" {
  name                  = var.cont_name
  storage_account_name  = azurerm_storage_account.stg.name
  depends_on            = [azurerm_storage_account.stg]
  container_access_type = "private"
}

############ KeyVault ############

resource "azurerm_key_vault" "kv" {
  name                            = var.keyvault_name
  location                        = var.location
  resource_group_name             = azurerm_resource_group.rg_name.name
  tenant_id                       = data.azurerm_client_config.current.tenant_id
  depends_on                      = [azurerm_resource_group.rg_name]
  sku_name                        = "standard"
  enabled_for_deployment          = true
  enabled_for_disk_encryption     = true
  enabled_for_template_deployment = true
  purge_protection_enabled        = true
}

############ Access Policy KV ############

resource "azurerm_key_vault_access_policy" "current" {
  key_vault_id = azurerm_key_vault.kv.id
  object_id    = data.azurerm_client_config.current.object_id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  depends_on   = [azurerm_key_vault.kv]

  secret_permissions  = ["Get", "List", "Set"]
  storage_permissions = ["Get", "List", "Set"]
}

############ KV Secrets ############

resource "azurerm_key_vault_secret" "tfazspn-kv-sc" {
  name         = "SPNPass"
  value        = azuread_application_password.tfazsp.value
  key_vault_id = azurerm_key_vault.kv.id
  depends_on   = [azurerm_key_vault.kv]

}

resource "azurerm_key_vault_secret" "tfazappid-kv-sc" {
  name         = "tfazAppID"
  value        = azuread_service_principal.tfazsp.application_id
  key_vault_id = azurerm_key_vault.kv.id
  depends_on   = [azurerm_key_vault.kv]
}

resource "azurerm_key_vault_secret" "tfazstg-kv-sc" {
  name         = "SASPass"
  value        = azurerm_storage_account.stg.name
  key_vault_id = azurerm_key_vault.kv.id
  depends_on   = [azurerm_key_vault.kv]
}

resource "azurerm_key_vault_secret" "tfaz-tnt-kv-sc" {
  name         = "tenant-id"
  value        = data.azuread_client_config.current.tenant_id
  key_vault_id = azurerm_key_vault.kv.id
  depends_on   = [azurerm_key_vault.kv]
}

resource "azurerm_key_vault_secret" "tfaz-subid-kv-sc" {
  name         = "subscription-id"
  value        = data.azurerm_client_config.current.subscription_id
  key_vault_id = azurerm_key_vault.kv.id
  depends_on   = [azurerm_key_vault.kv]
}

resource "azurerm_key_vault_secret" "stgname" {
  name         = "stgname"
  value        = data.azurerm_storage_account.stg.name
  key_vault_id = azurerm_key_vault.kv.id
  depends_on   = [azurerm_key_vault.kv]
}

resource "azurerm_key_vault_secret" "tfaz-vmp-kv-sc" {
  name         = "VMAdminPass"
  value        = var.VMAdminPass
  key_vault_id = azurerm_key_vault.kv.id
  depends_on   = [azurerm_key_vault.kv]
}

############ Azure Service Endpoint ############

resource "azuredevops_serviceendpoint_azurerm" "AzServEndPoint" {
  project_id                = data.azuredevops_project.tfazlab.id
  service_endpoint_name     = "AZ Server Conn"
  credentials {
    serviceprincipalid  = azuread_service_principal.tfazsp.application_id
    serviceprincipalkey = azuread_application_password.tfazsp.value
  }
  
  azurerm_spn_tenantid      = data.azurerm_client_config.current.tenant_id
  azurerm_subscription_id   = data.azurerm_client_config.current.subscription_id
  azurerm_subscription_name = var.subscription_id
}

############ SPN ############

resource "azuread_application" "tfazsp" {
  display_name = "tfazhh"
  owners       = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal" "tfazsp" {
  application_id = azuread_application.tfazsp.application_id
  owners         = [data.azuread_client_config.current.object_id]
}

resource "azuread_application_password" "tfazsp" {
  application_object_id = azuread_application.tfazsp.object_id
}

resource "azurerm_role_assignment" "main" {
  principal_id         = azuread_service_principal.tfazsp.id
  scope                = azurerm_key_vault.kv.id
  role_definition_name = "Contributor"
}

############ Azure DevOps Pipeline ############

resource "azuredevops_build_definition" "DeployPipeline" {
  name            = "tfaz_pipe"
  project_id      = data.azuredevops_project.tfazlab.id
  agent_pool_name = "Hosted Ubuntu 1604"
  depends_on      = [data.azuredevops_project.tfazlab, data.azuredevops_git_repository.tfazrepo]

  ci_trigger {
    use_yaml = true
  }

  variable_groups = [azuredevops_variable_group.hawaVB.id]

  repository {
    repo_type   = "TfsGit"
    repo_id     = data.azuredevops_git_repository.tfazrepo.id
    branch_name = "main"
    yml_path    = "./BuildDefinitions/tfazbuild.yml"
  }
}