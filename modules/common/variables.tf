variable "resource_group_name" {
  default = ""
}

variable "location" {
  default = ""
}

variable "la_workspace_name" {
  default = ""
}

variable "la_workspace_sku" {
  default = "PerGB2018"
}

variable "retention" {
  default = "30"
}

variable "recovery_vault_name" {
  default = ""
}

variable "recovery_vault_sku" {
  default = "Standard"
}

variable "storage_account_name" {
  default = ""
}

variable "account_tier" {
  default = "Standard"
}

variable "replication_type" {
  default = "LRS"
}
