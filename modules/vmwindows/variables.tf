variable "location" {
  default = ""
}

variable "resource_group_name" {
  default = ""
}

variable "subnet_id" {
  default = ""
}

variable "windows_name" {
  type    = map(string)
  default = {}
}

variable "windows_avs" {
  default = ""
}

variable "sa_blob_endpoint" {
  default = ""
}

variable "vm_extension_name" {
  default = ""
}

variable "fault_domain_count" {
  default = "2"
}

variable "update_domain_count" {
  default = "5"
}

variable "user_admin" {
  default = "Rodrigo-N01510943"
}

variable "password" {
  default = "Admin12345"
}

variable "size" {
  default = "Standard_B1s"
}

variable "disk_attr_windows" {
  type = map(string)
  default = {
    type    = "StandardSSD_LRS"
    size    = "128"
    caching = "ReadWrite"
  }
}

variable "os_info_windows" {
  type = map(string)
  default = {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}

variable "vm_extension_info" {
  type = map(string)
  default = {
    publisher = "Microsoft.Azure.Security.AntimalwareSignature"
    type      = "AntimalwareConfiguration"
    version   = "2.0"
  }
}

locals {
  common_tags = {
    Name         = "Terraform-Class"
    Project      = "Learning"
    ContactEmail = "rodrichavezm@gmail.com"
    Environment  = "Lab"
  }
}


