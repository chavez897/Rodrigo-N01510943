resource "azurerm_availability_set" "avset-windows" {
  name                         = var.windows_avs
  location                     = var.location
  resource_group_name          = var.resource_group_name
  platform_fault_domain_count  = var.fault_domain_count
  platform_update_domain_count = var.update_domain_count
  tags                         = local.common_tags
}

resource "azurerm_public_ip" "vmwindows-pip" {
  for_each            = var.windows_name
  name                = "${each.key}-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
  domain_name_label   = "win-dn-0195934-${each.key}"
  tags                = local.common_tags
}

resource "azurerm_network_interface" "vmwindows-interface" {
  for_each            = var.windows_name
  name                = "${each.key}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = local.common_tags

  ip_configuration {
    name                          = "${each.key}-ipconfig"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vmwindows-pip[each.key].id
  }
}

resource "azurerm_windows_virtual_machine" "vmwindows-vm" {
  for_each = var.windows_name
  depends_on = [
    azurerm_availability_set.avset-windows
  ]
  name                  = each.key
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.vmwindows-interface[each.key].id]
  size                  = var.size
  tags                  = local.common_tags
  availability_set_id   = azurerm_availability_set.avset-windows.id

  os_disk {
    name                 = "${each.key}-os-disk"
    caching              = var.disk_attr_windows["caching"]
    storage_account_type = var.disk_attr_windows["type"]
    disk_size_gb         = var.disk_attr_windows["size"]
  }

  source_image_reference {
    publisher = var.os_info_windows["publisher"]
    offer     = var.os_info_windows["offer"]
    sku       = var.os_info_windows["sku"]
    version   = var.os_info_windows["version"]
  }

  computer_name  = "w-assigment1"
  admin_username = var.user_admin
  admin_password = var.password

  winrm_listener {
    protocol = "Http"
  }

  boot_diagnostics {
    storage_account_uri = var.sa_blob_endpoint
  }
}

resource "azurerm_virtual_machine_extension" "antimalware" {
  for_each                   = var.windows_name
  name                       = var.vm_extension_name
  virtual_machine_id         = azurerm_windows_virtual_machine.vmwindows-vm[each.key].id
  publisher                  = var.vm_extension_info["publisher"]
  type                       = var.vm_extension_info["type"]
  type_handler_version       = var.vm_extension_info["version"]
  auto_upgrade_minor_version = true
  tags                       = local.common_tags
}
