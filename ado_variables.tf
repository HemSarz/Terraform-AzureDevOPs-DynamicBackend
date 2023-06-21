resource "azuredevops_variable_group" "hawaVB" {
  project_id   = data.azuredevops_project.tfazlab.id
  name         = "hawaVB"
  description  = "This Variable Group should be linked to an Azure Key Vault"
  allow_access = true


  key_vault {
    name                = azurerm_key_vault.kv.name
    service_endpoint_id = azuredevops_serviceendpoint_azurerm.AzServEndPoint.id
  }


  depends_on = [
    azurerm_key_vault_secret.tfaz-subid-kv-sc,
    azurerm_key_vault_secret.tfaz-tnt-kv-sc,
    azurerm_key_vault_secret.tfazappid-kv-sc,
    azurerm_key_vault_secret.tfazspn-kv-sc,
    azurerm_key_vault_secret.tfazstg-kv-sc,
    azurerm_key_vault_secret.tfaz-vmp-kv-sc
  ]

  variable {
    name = "SPNPass"
  }

  variable {
    name = "tfazAppID"
  }

  variable {
    name = "SASPass"
  }

  variable {
    name = "tenant_id"
  }

  variable {
    name = "subscription_id"
  }
  variable {
    name = "VMAdminPass"
  }
}