output "network_security_group_name" {
  description = "the name of the new network security group"
  value       = azurerm_network_security_group.network_security_group.name
}

output "network_security_group_id" {
  description = "the id of the new network security group"
  value       = azurerm_network_security_group.network_security_group.id
}

output "custom_rules" {
  description = "a map of all custom rules created"
  value       = azurerm_network_security_rule.custom_rules
}