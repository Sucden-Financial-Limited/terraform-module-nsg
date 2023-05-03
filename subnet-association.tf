resource "azurerm_subnet_network_security_group_association" "subnet_association" {
  for_each                  = var.subnet_ids
  subnet_id                 = each.value
  network_security_group_id = azurerm_network_security_group.network_security_group.id
}