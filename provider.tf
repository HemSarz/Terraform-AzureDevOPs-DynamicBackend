terraform {
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">= 0.5.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.59.0"
    }

    azuread = {
      source  = "hashicorp/azuread"
      version = ">= 2.39.0"
    }

    random = {
      source  = "hashicorp/random"
      version = ">=3.5.1"
    }
  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}

provider "azuredevops" {
  org_service_url       = var.AZDO_ORG_SERVICE_URL
  personal_access_token = var.AZDO_PERSONAL_ACCESS_TOKEN
}