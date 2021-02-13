# Create azure resource group

resource "azurerm_resource_group" "example" {
  name     = "${var.resource_group}"
  location = "${var.resource_group_location}"
}
# Create Log Analytics Workspace
resource "azurerm_log_analytics_workspace" "example" {
  name                = "${var.azure_log_analytics_workspace_name}"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  sku                 = "${var.loganalytics_ws_sku}"
  retention_in_days   = 30
}