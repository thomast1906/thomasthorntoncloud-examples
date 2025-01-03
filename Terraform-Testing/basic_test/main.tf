# create local example file

resource "local_file" "example" {
  content  = "This is an example file."
  filename = "${path.module}/example.txt"
}
