resource "azuredevops_variable_group" "hawaVB" {
  project_id   = data.azuredevops_project.tfazlab.id
  name         = "hawaVB"
  description  = "This Variable Group should be linked to an Azure Key Vault"
  allow_access = true

  variable {
    name  = "SPNPass"
    value = azuread_application_password.tfazsp.value
  }

  variable {
    name  = "SASPass"
    value = azurerm_storage_account.stg.primary_access_key
  }

variable {
  value = var.tenant_id
}

  variable {
    name  = "VMAdminPass"
    value = var.VMAdminPass
  }
}