resource "azuredevops_variable_group" "infraVB" {
  project_id   = data.azuredevops_project.tfazlab.id
  name         = "infraVB"
  description  = "PipelineVBs"
  allow_access = true


  key_vault {
    name                = azurerm_key_vault.kv.name
    service_endpoint_id = azuredevops_serviceendpoint_azurerm.AdoServEndPoint.id
  }

  depends_on = [
    azuredevops_serviceendpoint_azurerm.AdoServEndPoint,
    azurerm_key_vault_access_policy.KVAdoServEP,
  ]

  variable {
    name = "rg_name"
  }

  variable {
    name = "storage_account_name"
  }

  variable {
    name = "cont_name"
  }
}