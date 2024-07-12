resource "local_file" "create_file" {
  content = "Variable demo"
  filename = "${var.my_local_file}"
}