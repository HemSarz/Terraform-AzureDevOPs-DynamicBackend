terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "tfazstg"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}