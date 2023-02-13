resource "azurerm_spring_cloud_service" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku_name            = var.sku_name
  dynamic "network" {
    for_each = var.network.app_subnet_id != null && var.network.service_runtime_subnet_id != null ? [1] : []
    content {
      app_subnet_id             = var.network.app_subnet_id
      service_runtime_subnet_id = var.network.service_runtime_subnet_id
    }
  }
  tags = merge(
    var.additional_tags,
    {
      created-by = "iac-tf"
    },
  )
}
