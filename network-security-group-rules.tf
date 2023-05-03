#####################################################################
# Add Blocking Rules. ###############################################
#####################################################################

resource "azurerm_network_security_rule" "DenyAzureLoadBalancerInbound" {
  access                      = "Deny"
  description                 = "Deny Traffic from Azure Load Balancer"
  destination_address_prefix  = "*"
  destination_port_range      = "*"
  direction                   = "Inbound"
  name                        = "DenyAzureLoadBalancerInbound"
  network_security_group_name = azurerm_network_security_group.network_security_group.name
  priority                    = 4096
  protocol                    = "*"
  resource_group_name         = var.resource_group_name
  source_address_prefix       = "AzureLoadBalancer"
  source_port_range           = "*"
}

resource "azurerm_network_security_rule" "DenyVirtualNetworkInbound" {
  access                      = "Deny"
  description                 = "Deny Traffic from Virtual Network"
  destination_address_prefix  = "*"
  destination_port_range      = "*"
  direction                   = "Inbound"
  name                        = "DenyVirtualNetworkInbound"
  network_security_group_name = azurerm_network_security_group.network_security_group.name
  priority                    = 4095
  protocol                    = "*"
  resource_group_name         = var.resource_group_name
  source_address_prefix       = "VirtualNetwork"
  source_port_range           = "*"
}

#####################################################################
# Add Custom Rules. #################################################
#####################################################################

resource "azurerm_network_security_rule" "custom_rules" {
  for_each                     = { for rule in var.custom_rules : rule.name => rule }
  access                       = try(each.value.access, "Allow")
  description                  = try(each.value.description, null)
  destination_address_prefix   = try(each.value.destination_address_prefix, null)
  destination_address_prefixes = try(each.value.destination_address_prefixes, null)
  destination_port_range       = try(each.value.destination_port_range, null)
  destination_port_ranges      = try(each.value.destination_port_ranges, null)
  direction                    = try(each.value.direction, "Inbound")
  name                         = try(each.value.name)
  network_security_group_name  = azurerm_network_security_group.network_security_group.name
  priority                     = try(each.value.priority)
  protocol                     = try(each.value.protocol, "*")
  resource_group_name          = var.resource_group_name
  source_address_prefix        = try(each.value.source_address_prefix, null)
  source_address_prefixes      = try(each.value.source_address_prefixes, null)
  source_port_range            = try(each.value.source_port_range, null)
  source_port_ranges           = try(each.value.source_port_ranges, null)
}