variable "subscription_id" {
  type        = string
  description = "The Subscription Id for Azure account"
}

variable "client_id" {
  type        = string
  description = "The Client Id of the service principal"
}

variable "client_secret" {
  type        = string
  description = "The client secret of the service pricipal"
}

variable "tenant_id" {
  type        = string
  description = "the tenant Id of the directory"
}

variable "resource_group" {
  type        = string
  description = "The Azure resource group name"
}

variable "resource_group_location" {
  type        = string
  description = "The Azure resource group location"

}
variable "azure_log_analytics_ws_name" {
  type        = string
  description = "The Azure Log Analytics workspace name"
}

variable "log_analytics_ws_sku" {
  type        = string
  description = "The Log Analytics workspace SKU"

}

variable "azure_sentinel_rule_name" {
  type        = string
  description = "The Azure Sentinel rule name"

}