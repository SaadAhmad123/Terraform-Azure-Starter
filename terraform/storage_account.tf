resource "azurerm_storage_account" "project" {
  name                     = local.name_prefix
  resource_group_name      = azurerm_resource_group.project.name
  location                 = azurerm_resource_group.project.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = local.tags
}