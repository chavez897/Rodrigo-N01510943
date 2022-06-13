module "rgroup" {
  source   = "./modules/rgroup"
  location = "australiacentral"
  rg_name  = "0195934-assigment1-RG"
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