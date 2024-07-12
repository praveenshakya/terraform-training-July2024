terraform {
    backend "consul" {
        address = "localhost:8500"
        scheme = "http"
        path = "praveen/terraform.tfstate"
        lock = true
        gzip = false
    }
}