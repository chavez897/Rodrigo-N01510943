output "la_workspace" {
  value = azurerm_log_analytics_workspace.la_workspace
}

output "recovery_vault" {
  value = azurerm_recovery_services_vault.recovery_vault
}

output "storage_account" {
  value = azurerm_storage_account.storage_account
}