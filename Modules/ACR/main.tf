/*
Deployment of Azure Container Registry
Reference: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry
*/

resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location

  sku = "Basic"

  admin_enabled = true
}