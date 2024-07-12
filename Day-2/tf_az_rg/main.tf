resource "azurerm_resource_group" "rg" {
    name = random_string.rs.id
    location = var.location
}

resource "random_string" "rs" {
    special = false
    length = 9
}
