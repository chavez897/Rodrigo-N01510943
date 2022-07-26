output "windows-vm-id" {
  value = values(azurerm_windows_virtual_machine.vmwindows-vm)[*].id
}

output "windows-vm-hostname" {
  value = values(azurerm_windows_virtual_machine.vmwindows-vm)[*].name
}

output "windows-vm-fqdn" {
  value = values(azurerm_public_ip.vmwindows-pip)[*].fqdn
}

output "windows-vm-private-address" {
  value = values(azurerm_windows_virtual_machine.vmwindows-vm)[*].private_ip_address
}

output "windows-vm-public-address" {
  value = values(azurerm_windows_virtual_machine.vmwindows-vm)[*].public_ip_address
}