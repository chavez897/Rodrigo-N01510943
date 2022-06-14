module "rgroup" {
  source   = "./modules/rgroup"
  location = "australiacentral"
  rg_name  = "5934-assigment1-RG"
}

module "network" {
  source              = "./modules/network"
  resource_group_name = module.rgroup.rg.name
  location            = "australiacentral"
  vnet_name           = "assigment1-vnet"
  vnet_space          = ["10.0.0.0/16"]
  subnet_name         = "assigment1-subnet"
  subnet_space        = ["10.0.1.0/24"]
  nsg_name            = "assigment1-nsg"
}

module "common" {
  source               = "./modules/common"
  resource_group_name  = module.rgroup.rg.name
  location             = "australiacentral"
  la_workspace_name    = "assigment1-la-workspace"
  recovery_vault_name  = "assigment1-recovery-vault"
  storage_account_name = "assigment1sa"
}
