# Create Azure Resource group

resource "azurerm_resource_group" "example" {
  name     = "${var.resource_group}"
  location = "${var.resource_group_location}"
}

# Create Log Analytics workspace 
resource "azurerm_log_analytics_workspace" "example" {
  depends_on          = [azurerm_resource_group.example]
  name                = "${var.azure_log_analytics_ws_name}"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  sku                 = "${var.log_analytics_ws_sku}"

}
# Create Azure Sentinel Alert Rule
resource "azurerm_sentinel_alert_rule_scheduled" "example" {
  depends_on                 = [azurerm_log_analytics_workspace.example]
  name                       = "${var.azure_sentinel_rule_name}"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.example.id
  display_name               = "${var.azure_sentinel_rule_name}"
  severity                   = "High"
  query                      = <<QUERY
    AzureActivity |
  where OperationName == "Create or Update Virtual Machine" or OperationName =="Create Deployment" |
  where ActivityStatus == "Succeeded" |
  make-series dcount(ResourceId) default=0 on EventSubmissionTimestamp in range(ago(2h), now(), 1d) by Caller
QUERY
}