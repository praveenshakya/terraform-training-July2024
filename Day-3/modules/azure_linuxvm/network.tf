resource "azurerm_virtual_network" "myterraformnetwork" {
    name = "myVnet"
    address_space = ["10.0.0.0/16"]
    location = var.location
    resource_group_name = azurerm_resource_group.myterraformgroup.name
}

resource "azurerm_subnet" "myterraformsubnet" {
    name = "mySubnnet"
    resource_group_name = azurerm_resource_group.myterraformgroup.name
    virtual_network_name = azurerm_virtual_network.myterraformnetwork.name
    address_prefixes = ["10.0.1.0/24"]
}


resource "azurerm_network_security_group" "myterraformnsg" {
    name = "myNetworkSecurityGroup"
    location = var.location
    resource_group_name = azurerm_resource_group.myterraformgroup.name
    security_rule {
        name = "Web"
        priority = 1001
        direction = "Inbound"
        access = "Allow"
        protocol = "Tcp"
        source_port_range = "*"
        destination_port_range = "22"
        source_address_prefix = "*"
        destination_address_prefix = "*"
    }
}


resource "azurerm_network_interface" "myterraformnic" {
    name = "praveenNIC"
    location = var.location
    resource_group_name = azurerm_resource_group.myterraformgroup.name
    ip_configuration {
        name = "myNicConfiguration"
        subnet_id = azurerm_subnet.myterraformsubnet.id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id = azurerm_public_ip.myterraformpublicip.id
    }
}

