resource "azurerm_resource_group" "myterraformgroup" {
    name = "${random_string.rgprefix.result}rgdemo"
    location = "westus2"
}

resource "random_string" "rgprefix" {
    length = "9"
    special = false
}