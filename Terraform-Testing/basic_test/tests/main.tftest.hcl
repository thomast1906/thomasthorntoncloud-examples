run "verify_local_file_creation" {
  command = plan

  assert {
    condition     = local_file.example.content == "This is an example file."
    error_message = "File content does not match expected value"
  }

  assert {
    condition     = local_file.example.filename == "${path.module}/example.txt"
    error_message = "File path does not match expected value"
  }
}

run "verify_file_exists" {
  command = apply

  assert {
    condition     = fileexists("${path.module}/example.txt")
    error_message = "File was not created at expected location"
  }
}