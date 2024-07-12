output "ssh_password" {
    value = module.azure_linuxvm.ssh_password
}
output "sshuser" {
    value = module.azure_linuxvm.sshuser
}
output "vm_public_ip" {
    value = module.azure_linuxvm.vm_public_ip
}