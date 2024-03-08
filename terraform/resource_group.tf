resource "azurerm_resource_group" "project" {
  name     = local.name_prefix
  location = var.location
  tags     = local.tags
}
