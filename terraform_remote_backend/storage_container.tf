resource "azurerm_storage_container" "dev" {
  name                  = "devtfstate"
  storage_account_name  = azurerm_storage_account.tf_remote_backend.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "nonprod" {
  name                  = "nonprodtfstate"
  storage_account_name  = azurerm_storage_account.tf_remote_backend.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "prod" {
  name                  = "prodtfstate"
  storage_account_name  = azurerm_storage_account.tf_remote_backend.name
  container_access_type = "private"
}
