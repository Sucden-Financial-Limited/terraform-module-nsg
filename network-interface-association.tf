resource "azurerm_network_interface_security_group_association" "network_interface_association" {
  for_each                  = var.network_interface_ids
  network_interface_id      = each.value
  network_security_group_id = azurerm_network_security_group.network_security_group.id
}