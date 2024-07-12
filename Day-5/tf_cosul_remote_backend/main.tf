resource "random_string" "rgprefix" {
    length = "9"
    special = false
}

resource "azurerm_resource_group" "myterraformgroup" {
    name = "${random_string.rgprefix.result}rgdemo-${var.rgsuffix}"
    location = var.location
}

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