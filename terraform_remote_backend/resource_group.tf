resource "azurerm_resource_group" "tf_remote_backend" {
  name     = "${var.short_project_name}tfrb"
  location = var.location
  tags     = local.tags
}
