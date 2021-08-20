resource "azurerm_log_analytics_workspace" "la_workspace" {
  name                = var.law_name
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = var.sku_law
  retention_in_days   = var.retention_in_days
  depends_on = [
    var.rg_name,
  ]
  tags = local.common_tags
}

resource "azurerm_recovery_services_vault" "recovery_vault" {
  name                = var.sv_name
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = var.sku_vault
  depends_on = [
    var.rg_name,
  ]
  tags = local.common_tags
}

resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_acc
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "storage_container" {
  name                  = var.storage_container
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = "private"
}

# resource "azurerm_storage_blob" "g5-blob" {
#   name                   = var.storage_blob
#   storage_account_name   = azurerm_storage_account.storage_account.name
#   storage_container_name = azurerm_storage_container.storage_container.name
#   type                   = "Block"
#   source                 = ""
# }

