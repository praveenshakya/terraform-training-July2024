resource "azurerm_linux_virtual_machine" "myterraformvm" {
    name = "myAdmaticVM"
    location = var.location
    resource_group_name = azurerm_resource_group.myterraformgroup.name
    network_interface_ids = [azurerm_network_interface.myterraformnic.id]
    size = "Standard_B2s"
    os_disk {
        name = "myOsDisk"
        caching = "ReadWrite"
        storage_account_type = "Premium_LRS"
    }


    source_image_reference {
        publisher = "Canonical"
        offer = "UbuntuServer"
        sku = "18.04-LTS"
        version = "latest"
    }

    admin_username = "praveenshakya"
    admin_password = random_string.sshpassword.id
    disable_password_authentication = false

    # admin_ssh_key {
    #     username   = "praveenshakya"
    #     public_key = file("~/.ssh/id_rsa.pub")
    # }
}



resource "random_string" "sshpassword" {
    length = 20
    special = true
}


resource "azurerm_public_ip" "myterraformpublicip" {
    name = "myPublicIP"
    location = var.location
    resource_group_name = azurerm_resource_group.myterraformgroup.name
    allocation_method = "Dynamic"
}