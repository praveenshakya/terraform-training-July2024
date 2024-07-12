module "azure_linuxvm" {
    source = "../modules/azure_linuxvm"
    location = "westus"
    rgsuffix = "fromModuleDemo"
    ssh_user = "praveenshakya"
}