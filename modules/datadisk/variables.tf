variable "location" {
  default = ""
}

variable "resource_group_name" {
  default = ""
}

variable "vm_id" {
  type    = map(string)
  default = {}
}

variable "datadisk_attr" {
  type = map(string)
  default = {
    type          = "Standard_LRS"
    create_option = "Empty"
    size          = "10"
    lun           = "0"
    caching       = "ReadWrite"
  }
}

locals {
  common_tags = {
    Project        = "Automation Project-Assignment 1"
    Name           = "Rodrigo Chavez"
    ExpirationDate = "2022-06-30"
    Environment    = "Lab"
  }
}