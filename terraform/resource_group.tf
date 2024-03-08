resource "azurerm_resource_group" "project" {
  name     = var.SHORT_PROJECT_NAME
  location = var.location
  tags     = local.tags
}
