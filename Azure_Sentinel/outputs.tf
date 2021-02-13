output "azure_log_analytics_workspace" {
  value = azurerm_log_analytics_workspace.example.id
}

output "azure_sentinel_rules" {
  value = azurem_sentinel_alert_rule_scheduled.example.id
}