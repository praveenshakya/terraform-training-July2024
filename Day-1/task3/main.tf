resource "random_string" "random_str" {
  count = 10
  length = 10
}

output "get_random_string" {
  value = [for i in random_string.random_str : i.result]
}