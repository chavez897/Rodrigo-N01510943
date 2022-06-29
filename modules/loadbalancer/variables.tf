variable "location" {
  default = ""
}

variable "resource_group_name" {
  default = ""
}

variable "lb_pip_name" {
  default = ""
}

variable "lb_name" {
  default = ""
}

variable "pool_name" {
  default = ""
}

variable "vm_network_interface_id" {
  type    = map(string)
  default = {}
}

variable "nic_ip_config_name" {
  type    = map(string)
  default = {}
}

locals {
  common_tags = {
    Project        = "Automation Project-Assignment 1"
    Name           = "Rodrigo Chavez"
    ExpirationDate = "2022-06-30"
    Environment    = "Lab"
  }
}
