resource "azurerm_storage_account" "tf_remote_backend" {
  name                     = "${var.SHORT_PROJECT_NAME}tfrb"
  resource_group_name      = azurerm_resource_group.tf_remote_backend.name
  location                 = azurerm_resource_group.tf_remote_backend.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = local.tags
}