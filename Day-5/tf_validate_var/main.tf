resource "azurerm_resource_group" "myterraformgroup" {
    name = "${random_string.rs.id}_${var.num}"
    location = var.location
}
resource "random_string" "rs" {
    special = false
    length = 12
}
