resource "random_integer" "random_int" {
  min = 10
  max = 50
}

resource "random_password" "password" {
  length           = 16
}

resource "local_file" "file_name" {
    content = nonsensitive(random_password.password.result)
    filename = "/tmp/random_${random_integer.random_int.result}.txt"
  
}

output "get_file_name" {
  value = local_file.file_name.filename
}


