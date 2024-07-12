# resource "local_file" "demo_file1" {
#     content = "Hello BoA"
#     filename = "/tmp/demofile1.txt"
  
# }

# resource "local_file" "demo_file2" {
#     content = "Hello BoA"
#     filename = "/tmp/demofile2.txt"
  
# }

#=======================================================
resource "random_string" "datagen" {
  length = 24
  special = false
  upper = false
}


resource "random_password" "password" {
  length           = 16
  override_special = "!#$%&*()-_=+[]{}<>:?"
}


# =========================================================

#output Demo

output "kayname" {
  value = random_string.datagen.id
}

output "getPassword" {
  value = nonsensitive(random_password.password.result)
  sensitive = false
}