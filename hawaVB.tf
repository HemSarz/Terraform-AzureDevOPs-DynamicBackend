resource "azuredevops_variable_group" "hawaVB" {
  project_id   = data.azuredevops_project.tfazlab.id
  name         = "hawaVB"
  description  = "ConnVB"
  allow_access = true


  key_vault {
    name                = azurerm_key_vault.kv.name
    service_endpoint_id = azuredevops_serviceendpoint_azurerm.AdoServEndPoint.id
  }


  depends_on = [
    azurerm_key_vault_secret.tfaz-subid-kv-sc,
    azurerm_key_vault_secret.tfaz-tnt-kv-sc,
    azurerm_key_vault_secret.tfazappid-kv-sc,
    azurerm_key_vault_secret.tfazspn-kv-sc,
    azurerm_key_vault_secret.tfazstg-kv-sc,
    azurerm_key_vault_secret.tfaz-vmp-kv-sc,
    azurerm_key_vault_secret.tfaz-ContName-kv-sc,
    azurerm_key_vault_secret.tfaz-RGName-kv-sc,
    azurerm_key_vault_secret.tfaz-STGName-kv-sc,
    azuredevops_serviceendpoint_azurerm.AdoServEndPoint,
    azurerm_key_vault_access_policy.KVAdoServEP,
  ]

  variable {
    name = "SPNPass"
  }

  variable {
    name = "tfazAppID"
  }

  variable {
    name = "STGPass"
  }

  variable {
    name = "TNTid"
  }

  variable {
    name = "SUBid"
  }
  variable {
    name = "VMAdminPass"
  }

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