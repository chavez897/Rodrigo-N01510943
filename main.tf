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

module "vmlinux" {
  source              = "./modules/vmlinux"
  resource_group_name = module.rgroup.rg.name
  location            = "australiacentral"
  nb_vount            = "2"
  subnet_id           = module.network.subnet.id
  linux_name          = "assigment1-linux-vm"
  linux_avs           = "linux-avs"
  sa_blob_endpoint    = module.common.storage_account.primary_blob_endpoint
  vm_extension_name   = "network-watcher"
}

module "vmwindows" {
  source              = "./modules/vmwindows"
  resource_group_name = module.rgroup.rg.name
  location            = "australiacentral"
  subnet_id           = module.network.subnet.id
  windows_name = {
    assigment1-win-vm = "assigment1-win-vm"
  }
  windows_avs       = "windows-avs"
  sa_blob_endpoint  = module.common.storage_account.primary_blob_endpoint
  vm_extension_name = "antimalware"

}


module "datadisk" {
  source              = "./modules/datadisk"
  resource_group_name = module.rgroup.rg.name
  location            = "australiacentral"
  vm_id = {
    linux1   = module.vmlinux.linux-vm-id[0]
    linux2   = module.vmlinux.linux-vm-id[1]
    windows1 = module.vmwindows.windows-vm-id[0]
  }
}

module "loadbalancer" {
  source              = "./modules/loadbalancer"
  resource_group_name = module.rgroup.rg.name
  location            = "australiacentral"
  lb_pip_name         = "lb-pip"
  lb_name             = "lb"
  pool_name           = "lb-pool-assigmet1"
  vm_network_interface_id = {
    linux1 = module.vmlinux.linux-nic-id[0]
    linux2 = module.vmlinux.linux-nic-id[1]
  }
  nic_ip_config_name = {
    linux1 = module.vmlinux.linux-ip-config-name[0][0]["name"]
    linux2 = module.vmlinux.linux-ip-config-name[1][0]["name"]
  }
}

module "database" {
  source              = "./modules/database"
  resource_group_name = module.rgroup.rg.name
  location            = "eastus"
  server_name         = "postgres-server-n01510943"
  db_name             = "postgres-db-n01510943"
}
