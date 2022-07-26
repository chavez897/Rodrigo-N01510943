variable "resource_group_name" {
  default = ""
}

variable "location" {
  default = ""
}

variable "vnet_name" {
  default = ""
}

variable "vnet_space" {
  default = ""
}

variable "subnet_name" {
  default = ""
}

variable "subnet_space" {
  default = ""
}

variable "nsg_name" {
  default = ""
}

locals {
  common_tags = {
    Project        = "Automation Project-Assignment 1"
    Name           = "Rodrigo Chavez"
    ExpirationDate = "2022-06-30"
    Environment    = "Lab"
  }
}