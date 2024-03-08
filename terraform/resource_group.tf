resource "azurerm_resource_group" "project" {
  name     = "${local.short_project_name}_${local.stage}"
  location = var.location
  tags     = local.tags
}
