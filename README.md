# Terraform Network Security Group Module
This module creates a new Network Security Group with two predefined rules that blocks all traffic from Virtual Network and AzureLoadBalancer, forcing the user to add custom rules for all required traffic. The Module also supports attaching the Network Security Group to multiple Subnets and Network Interfaces if required.

# Examples
Examples can be found [here](https://github.com/Sucden-Financial-Limited/terraform-module-nsg/tree/main/examples).

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.10.0, < 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >=3.10.0, < 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_network_interface_security_group_association.network_interface_association](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface_security_group_association) | resource |
| [azurerm_network_security_group.network_security_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_network_security_rule.DenyAzureLoadBalancerInbound](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_network_security_rule.DenyVirtualNetworkInbound](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_network_security_rule.custom_rules](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_subnet_network_security_group_association.subnet_association](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_custom_rules"></a> [custom\_rules](#input\_custom\_rules) | list of maps for custom rules | <pre>list(object({<br>    access                       = optional(string)<br>    description                  = optional(string)<br>    destination_address_prefix   = optional(string)<br>    destination_address_prefixes = optional(list(string))<br>    destination_port_ranges      = optional(list(string))<br>    destination_port_range       = optional(string)<br>    direction                    = optional(string)<br>    name                         = string<br>    priority                     = number<br>    protocol                     = optional(string)<br>    source_address_prefix        = optional(string)<br>    source_address_prefixes      = optional(list(string))<br>    source_port_range            = optional(string)<br>    source_port_ranges           = optional(list(string))<br>  }))</pre> | `[]` | no |
| <a name="input_location"></a> [location](#input\_location) | [REQUIRED] - azure location to place network security group | `string` | n/a | yes |
| <a name="input_network_interface_ids"></a> [network\_interface\_ids](#input\_network\_interface\_ids) | a map with network interface names (key) & ids (value) to attach to nsg, NOTE: the name is required due to the requirement of setting a known value for the resource key when using for\_each https://github.com/hashicorp/terraform/issues/29957 | `map(string)` | `{}` | no |
| <a name="input_network_security_group_name"></a> [network\_security\_group\_name](#input\_network\_security\_group\_name) | [REQUIRED] - name given to new network security group | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | [REQUIRED] - parent resource group of network security group inside | `string` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | a map with subnet names (key) & ids (value) to attach to nsg, NOTE: the name is required due to the requirement of setting a known value for the resource key when using for\_each https://github.com/hashicorp/terraform/issues/29957 | `map(string)` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | tags | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_custom_rules"></a> [custom\_rules](#output\_custom\_rules) | a map of all custom rules created |
| <a name="output_network_security_group_id"></a> [network\_security\_group\_id](#output\_network\_security\_group\_id) | the id of the new network security group |
| <a name="output_network_security_group_name"></a> [network\_security\_group\_name](#output\_network\_security\_group\_name) | the name of the new network security group |
