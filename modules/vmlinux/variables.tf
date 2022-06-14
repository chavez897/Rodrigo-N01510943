variable "location" {
  default = ""
}

variable "resource_group_name" {
  default = ""
}

variable "subnet_id" {
  default = ""
}

variable "linux_name" {
  default = ""
}

variable "linux_avs" {
  default = ""
}

variable "nb_vount" {
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

variable "size" {
  default = "Standard_B1s"
}

variable "user_admin" {
  default = "Rodrigo-N01510943"
}

variable "password" {
  default = "Admin12345"
}

variable "disk_attr" {
  type = map(string)
  default = {
    type    = "Premium_LRS"
    size    = "32"
    caching = "ReadWrite"
  }
}

variable "os_info" {
  type = map(string)
  default = {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "8_2-gen2"
    version   = "latest"
  }
}

variable "pub_key" {
  default = "~/.ssh/id_rsa.pub"
}

variable "private_key" {
  default = "~/.ssh/id_rsa"
}

variable "vm_extension_info" {
  type = map(string)
  default = {
    publisher = "Microsoft.Azure.NetworkWatcher"
    type      = "NetworkWatcherAgentLinux"
    version   = "1.4"
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
