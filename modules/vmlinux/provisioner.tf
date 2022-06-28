# resource "null_resource" "linux_provisioner" {
#   count = var.nb_vount
#   depends_on = [
#     azurerm_linux_virtual_machine.vmlinux-vm
#   ]

#   provisioner "remote-exec" {
#     inline = [
#       "/usr/bin/hostname"
#     ]
#     connection {
#       type        = "ssh"
#       user        = var.user_admin
#       private_key = file(var.private_key)
#       host        = element(azurerm_linux_virtual_machine.vmlinux-vm[*].public_ip_address, count.index + 1)
#     }
#   }

# }