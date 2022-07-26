resource "null_resource" "ansible-playbook" {
  depends_on = [
    azurerm_virtual_machine_data_disk_attachment.datadisk_vm
  ]

  provisioner "local-exec" {
    command = "ansible-playbook ${var.playbook_path}"
  }

}