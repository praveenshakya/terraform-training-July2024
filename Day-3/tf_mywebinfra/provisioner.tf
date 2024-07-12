resource "null_resource" "copy_file" {
    
    triggers = {
        trigger = timestamp()
    }
    connection {
        host = module.azure_linuxvm.vm_public_ip
        user = module.azure_linuxvm.sshuser
        password = module.azure_linuxvm.ssh_password
        port = 22
        agent = false
        type = "ssh"
    }
    
    provisioner "file" {
        source = "data.csv"
        destination = "/tmp/data.txt"
    }
    
}

resource "null_resource" "remote-provisioner" {
   
    triggers = {
        trigger = local.flage24
    }
    connection {
        host = module.azure_linuxvm.vm_public_ip
        user = module.azure_linuxvm.sshuser
        password = module.azure_linuxvm.ssh_password
        port = 22
        agent = false
        type = "ssh"
    }
    
    provisioner "remote-exec" {
        inline = [ 
            "echo Remote Provision from terraform >> /tmp/remoteexec.txt",
            "touch /tmp/terraform_generated_file.txt",
            "sh /tmp/ansible_installer.sh",
            "ansible-playbook /tmp/ansible-playbook.yaml"
         ]
    }
    
    depends_on = [ module.azure_linuxvm, null_resource.copy_file, null_resource.install_ansible_script,null_resource.copy_playbook ]
}

locals {
  flage24 = 250
}

resource "null_resource" "install_ansible_script" {
    
    connection {
        host = module.azure_linuxvm.vm_public_ip
        user = module.azure_linuxvm.sshuser
        password = module.azure_linuxvm.ssh_password
        port = 22
        agent = false
        type = "ssh"
    }
    
    provisioner "file" {
        source = "ansible_installer.sh"
        destination = "/tmp/ansible_installer.sh"
    }
    
}

resource "null_resource" "copy_playbook" {
    triggers = {
        trigger = file("ansible-playbook.yaml")
    }
    provisioner "file" {
        source = "ansible-playbook.yaml"
        destination = "/tmp/ansible-playbook.yaml"
    }
    connection {
        type = "ssh"
        host = module.azure_linuxvm.vm_public_ip
        user = module.azure_linuxvm.sshuser
        password = module.azure_linuxvm.ssh_password
        port = 22
        agent = false
    }
}
