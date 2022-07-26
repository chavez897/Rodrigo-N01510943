resource "azurerm_log_analytics_workspace" "la_workspace" {
  name                = var.la_workspace_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.la_workspace_sku
  retention_in_days   = var.retention
  tags                = local.common_tags
}

resource "azurerm_recovery_services_vault" "recovery_vault" {
  name                = var.recovery_vault_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.recovery_vault_sku
  tags                = local.common_tags
}

resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_name
  location                 = var.location
  resource_group_name      = var.resource_group_name
  account_tier             = var.account_tier
  account_replication_type = var.replication_type
  tags                     = local.common_tags
}