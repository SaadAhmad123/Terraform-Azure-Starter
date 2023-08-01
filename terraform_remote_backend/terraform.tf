provider "azurerm" {
  subscription_id            = var.subscription_id
  client_id                  = var.client_id
  client_secret              = var.client_secret
  tenant_id                  = var.tenant_id
  skip_provider_registration = "true"
  features {}
}

resource "azurerm_resource_group" "tf_remote_backend" {
  name     = "${var.SHORT_PROJECT_NAME}tfrb"
  location = var.location
  tags     = local.tags
}
