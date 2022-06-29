variable "location" {
  default = ""
}

variable "resource_group_name" {
  default = ""
}

variable "server_name" {
  default = ""
}

variable "db_name" {
  default = ""
}

variable "sku" {
  default = "B_Gen5_2"
}

variable "storage" {
  type = map(string)
  default = {
    mb             = 5120
    retantion_days = 7
    redundant      = false
    grow           = true
  }
}

variable "user" {
  default = "psqladmin"
}

variable "password" {
  default = "H@Sh1CoR3!"
}

variable "server_version" {
  default = "9.5"
}

variable "ssl" {
  default = true
}

variable "charset" {
  default = "UTF8"
}

variable "collation" {
  default = "English_United States.1252"
}

locals {
  common_tags = {
    Project        = "Automation Project-Assignment 1"
    Name           = "Rodrigo Chavez"
    ExpirationDate = "2022-06-30"
    Environment    = "Lab"
  }
}