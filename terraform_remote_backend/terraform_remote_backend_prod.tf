resource "azurerm_storage_account" "tf_remote_backend_prod" {
  name                     = "${var.SHORT_PROJECT_NAME}tfrbprod"
  resource_group_name      = azurerm_resource_group.tf_remote_backend.name
  location                 = azurerm_resource_group.tf_remote_backend.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = local.tags
}

resource "azurerm_storage_container" "prod" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.tf_remote_backend_prod.name
  container_access_type = "private"
}
