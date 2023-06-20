resource "azuredevops_variable_group" "hawaVB" {
  project_id   = data.azuredevops_project.tfazlab.id
  name         = "hawaVB"
  description  = "This Variable Group should be linked to an Azure Key Vault"
  allow_access = true


  key_vault {
    name                = azurerm_key_vault.kv.name
    service_endpoint_id = azuredevops_serviceendpoint_azurerm.AzServEndPoint.id
  }
  variable {
    name  = "SPNPass"
    value = azuread_application_password.tfazsp.value
  }

  variable {
    name  = "tfazAppID"
    value = data.azuread_application.tfazsp.application_id
  }

  variable {
    name  = "SASPass"
    value = data.azurerm_storage_account.stg.primary_access_key
  }

  variable {
    name  = "tenant_id"
    value = data.azuread_client_config.current.tenant_id
  }

  variable {
    name  = "subscription_id"
    value = var.subscription_id
  }
  variable {
    name  = "VMAdminPass"
    value = var.VMAdminPass
  }
}