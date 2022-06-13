terraform {
  backend "azurerm" {
    resource_group_name  = "tfstateN01510943RG"
    storage_account_name = "tfstaten01510943sa"
    container_name       = "tfstatefiles"
    key                  = "tfstate-assigment1"
  }
}