terraform {
  backend "azurerm" {
    resource_group_name  = "rg01hh"
    storage_account_name = "tfazstg"
    container_name       = "cont01"
    key                  = "terraform.tfstate"
    access_key           = "meKGT1QjkKKldSern4WxuSBNb+OmJz3FSarrF2RFOIug1FeUiiMwnsix5evdEK1Kel1CuA6Ae8D6+ASt1zA/PQ=="
  }
}
