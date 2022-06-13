output "rg" {
  value = module.rgroup.rg.name
}

output "virtual-network" {
  value = module.network.virtual-network.name
}

output "subnet" {
  value = module.network.subnet.name
}