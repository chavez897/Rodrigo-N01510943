output "rg" {
  value = module.rgroup.rg.name
}

output "virtual-network" {
  value = module.network.virtual-network.name
}

output "subnet" {
  value = module.network.subnet.name
}

output "la_workspace" {
  value = module.common.la_workspace.name
}

output "recovery_vault" {
  value = module.common.recovery_vault.name
}

output "storage_account" {
  value = module.common.storage_account.name
}