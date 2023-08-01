resource "azurerm_storage_account" "tf_remote_backend_np" {
  name                     = "${var.SHORT_PROJECT_NAME}tfrbnp"
  resource_group_name      = azurerm_resource_group.tf_remote_backend.name
  location                 = azurerm_resource_group.tf_remote_backend.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = local.tags
}

resource "azurerm_storage_container" "nonprod" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.tf_remote_backend_np.name
  container_access_type = "private"
}
