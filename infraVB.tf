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
    azuredevops_variable_group.hawaVB,
    azurerm_key_vault_secret.tfaz-ContName-kv-sc,
    azurerm_key_vault_secret.tfaz-RGName-kv-sc,
    azurerm_key_vault_secret.tfaz-STGName-kv-sc,
    azuredevops_serviceendpoint_azurerm.AdoServEndPoint,
    azurerm_key_vault_access_policy.KVAdoServEP,
  ]

  variable {
    name = "RGName"
  }

  variable {
    name = "STGName"
  }

  variable {
    name = "ContName"
  }
}