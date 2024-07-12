
resource "random_integer" "random_int" {
  min = 10
  max = 50
}

resource "random_password" "password" {
  length           = 16
}

# resource "local_file" "file_name1" {
#     content = nonsensitive(random_password.password.result)
#     filename = "/tmp/file1.txt"
#     file_permission = 700
  
# }


# resource "local_file" "file_name2" {
#     content = nonsensitive(random_password.password.result)
#     filename = "/tmp/file2.txt"
#     file_permission = 700
  
# }

# resource "local_file" "file_name3" {
#     content = nonsensitive(random_password.password.result)
#     filename = "/tmp/file3.txt"
#     file_permission = 700
  
# }

# resource "local_file" "file_name4" {
#     content = nonsensitive(random_password.password.result)
#     filename = "/tmp/file4.txt"
#     file_permission = 700
  
# }

# resource "local_file" "file_name5" {
#     content = nonsensitive(random_password.password.result)
#     filename = "/tmp/file5.txt"
#     file_permission = 700
  
# }

resource "local_file" "file_name" {
    count = 5
    content = nonsensitive(random_password.password.result)
    filename = "/tmp/file${count.index + 1}.txt"
    file_permission = 700
  
}