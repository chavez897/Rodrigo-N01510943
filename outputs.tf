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

output "linux-vm-hostname" {
  value = module.vmlinux.linux-vm-hostname
}

output "linux-vm-fqdn" {
  value = module.vmlinux.linux-vm-fqdn
}

output "linux-vm-private-address" {
  value = module.vmlinux.linux-vm-private-address
}

output "linux-vm-public-address" {
  value = module.vmlinux.linux-vm-public-address
}