resource "azurerm_postgresql_server" "postgresql-server" {
  name                = var.server_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku_name = var.sku

  storage_mb                   = var.storage["mb"]
  backup_retention_days        = var.storage["retantion_days"]
  geo_redundant_backup_enabled = var.storage["redundant"]
  auto_grow_enabled            = var.storage["grow"]

  administrator_login          = var.user
  administrator_login_password = var.password
  version                      = var.server_version
  ssl_enforcement_enabled      = var.ssl
  tags                         = local.common_tags
}

resource "azurerm_postgresql_database" "postgresql-db" {
  name                = var.db_name
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.postgresql-server.name
  charset             = var.charset
  collation           = var.collation
}