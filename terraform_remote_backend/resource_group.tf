resource "azurerm_resource_group" "tf_remote_backend" {
  name     = "${var.SHORT_PROJECT_NAME}tfrb"
  location = var.location
  tags     = local.tags
}
