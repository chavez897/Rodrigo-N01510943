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

variable "vm_network_interface_id" {
  type    = map(string)
  default = {}
}
