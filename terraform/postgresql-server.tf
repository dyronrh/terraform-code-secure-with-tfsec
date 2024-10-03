
resource "azurerm_postgresql_server" "postgresql_server" {
  name                = "tfsec-psqlserver"
  location            = azurerm_resource_group.tfsec_rg.location
  resource_group_name = azurerm_resource_group.tfsec_rg.name

  administrator_login          = "psqladmin"
  administrator_login_password = "H@Sh1CoR3!"

  sku_name   = "GP_Gen5_4"
  version    = "11"
  storage_mb = 640000

  backup_retention_days        = 7
  geo_redundant_backup_enabled = true
  auto_grow_enabled            = true
  
  public_network_access_enabled    = true
  ssl_enforcement_enabled          = true
  ssl_minimal_tls_version_enforced = "TLS1_2"
  tags = {
    "Environment" = "prod"
    "CostCentre" = "subscribe-now"
  }
}

 resource "azurerm_postgresql_configuration" "pg_configuration" {
    name                = "connection_throttling"
    resource_group_name = azurerm_resource_group.tfsec_rg.name
    server_name         = azurerm_postgresql_server.postgresql_server.name
    value               = "on"
   }

 resource "azurerm_postgresql_configuration" "pg_configuration" {
    name                = "log_checkpoints"
    resource_group_name = azurerm_resource_group.tfsec_rg.name
    server_name         = azurerm_postgresql_server.postgresql_server.name
    value               = "on"
   }

 resource "azurerm_postgresql_configuration" "pg_configuration" {
    name                = "log_connections"
    resource_group_name = azurerm_resource_group.tfsec_rg.name
    server_name         = azurerm_postgresql_server.postgresql_server.name
    value               = "on"
   }
   