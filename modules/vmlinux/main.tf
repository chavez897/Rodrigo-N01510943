resource "azurerm_availability_set" "linux-avset" {
  name                         = var.linux_avs
  location                     = var.location
  resource_group_name          = var.resource_group_name
  platform_fault_domain_count  = var.fault_domain_count
  platform_update_domain_count = var.update_domain_count
}

resource "azurerm_public_ip" "vmlinux-pip" {
  count               = var.nb_vount
  name                = "${var.linux_name}-pip-${format("%1d", count.index + 1)}"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
  domain_name_label   = "dn-lin-0195934-${format("%1d", count.index + 1)}"
  tags                = local.common_tags
}

resource "azurerm_network_interface" "vmlinux-interface" {
  count               = var.nb_vount
  name                = "${var.linux_name}-nic-${format("%1d", count.index + 1)}"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = local.common_tags

  ip_configuration {
    name                          = "${var.linux_name}-ipconfig-${format("%1d", count.index + 1)}"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = element(azurerm_public_ip.vmlinux-pip[*].id, count.index + 1)
  }
}

resource "azurerm_linux_virtual_machine" "vmlinux-vm" {
  count = var.nb_vount
  depends_on = [
    azurerm_availability_set.linux-avset
  ]
  name                  = "${var.linux_name}-${format("%1d", count.index + 1)}"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [element(azurerm_network_interface.vmlinux-interface[*].id, count.index + 1)]
  size                  = var.size
  tags                  = local.common_tags
  availability_set_id   = azurerm_availability_set.linux-avset.id

  os_disk {
    name                 = "${var.linux_name}-os-disk-${format("%1d", count.index + 1)}"
    caching              = var.disk_attr["caching"]
    storage_account_type = var.disk_attr["type"]
    disk_size_gb         = var.disk_attr["size"]
  }

  source_image_reference {
    publisher = var.os_info["publisher"]
    offer     = var.os_info["offer"]
    sku       = var.os_info["sku"]
    version   = var.os_info["version"]
  }

  computer_name                   = "centos-${format("%1d", count.index + 1)}-assigment1"
  admin_username                  = var.user_admin
  admin_password                  = var.password
  disable_password_authentication = false

  admin_ssh_key {
    username   = var.user_admin
    public_key = file(var.pub_key)
  }

  boot_diagnostics {
    storage_account_uri = var.sa_blob_endpoint
  }
}

# resource "azurerm_virtual_machine_extension" "network-watcher" {
#   count                      = var.nb_vount
#   name                       = var.vm_extension_name
#   virtual_machine_id         = element(azurerm_linux_virtual_machine.vmlinux-vm[*].id, count.index + 1)
#   publisher                  = var.vm_extension_info["publisher"]
#   type                       = var.vm_extension_info["type"]
#   type_handler_version       = var.vm_extension_info["version"]
#   auto_upgrade_minor_version = true
# }
