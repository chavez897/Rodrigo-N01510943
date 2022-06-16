output "linux-vm-id" {
  value = azurerm_linux_virtual_machine.vmlinux-vm[*].id
}

output "linux-vm-hostname" {
  value = azurerm_linux_virtual_machine.vmlinux-vm[*].name
}

output "linux-vm-fqdn" {
  value = azurerm_public_ip.vmlinux-pip[*].fqdn
}

output "linux-vm-private-address" {
  value = azurerm_linux_virtual_machine.vmlinux-vm[*].private_ip_address
}

output "linux-vm-public-address" {
  value = azurerm_linux_virtual_machine.vmlinux-vm[*].public_ip_address
}