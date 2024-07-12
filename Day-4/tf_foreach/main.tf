resource "azurerm_resource_group" "myterraformgroup" {
    for_each = toset(local.rg_names)
    name = "admatic-rgabcd111-${each.key}"
    location = var.location
}

resource "azurerm_resource_group" "valrg" {
    for_each = tomap(local.demomap)
    name = "admatic-rgabcd111-${each.key}"
    location = var.location
}

variable "location" {
    description = "location for the azure resources "
    default = "westus2"
}

locals {
    a_string = "Robochef is an automated robotic kitchen"
    a_number = 15
    a_boolean = true
    rg_names = ["blue","red","orange","cyan","pink","amber"]
}

output "robochef_val" {
    value = local.a_string
}

locals {
    demomap = {
        name = "Saravanans"
        location = "chennnai"
        nation = "India"
    }
}