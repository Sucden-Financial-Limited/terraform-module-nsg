module "nsg" {
  source = "git::https://github.com/Sucden-Financial-Limited/terraform-module-nsg.git?ref=v1.0.0"

  network_security_group_name = "sucden-nsg"
  resource_group_name         = "sucden-rg"
  location                    = "uksouth"

  custom_rules = [
    {
      access                       = "Allow"
      description                  = "Allow Application Gateway"
      destination_address_prefixes = ["10.10.1.0/24", "10.10.2.0/24"]
      destination_port_ranges      = ["80", "443"]
      direction                    = "Inbound"
      name                         = "AllowApplicationGateway"
      priority                     = 100
      protocol                     = "*"
      source_address_prefixes      = ["10.1.1.0/24", "10.1.2.0/24"]
      source_port_range            = "*"
    },
    {
      access                     = "Allow"
      description                = "Allow RDP"
      destination_address_prefix = "10.10.1.0/24"
      destination_port_range     = "3389"
      direction                  = "Inbound"
      name                       = "AllowRDP"
      priority                   = 200
      protocol                   = "*"
      source_address_prefix      = "10.1.1.0/24"
      source_port_range          = "*"
    },
    {
      access                     = "Deny"
      description                = "Deny HTTP"
      destination_address_prefix = "Internet"
      destination_port_range     = "80"
      direction                  = "Outbound"
      name                       = "DenyHTTP"
      priority                   = 100
      protocol                   = "*"
      source_address_prefix      = "VirtualNetwork"
      source_port_range          = "*"
    }
  ]
}
