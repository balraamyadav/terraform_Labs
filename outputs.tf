output "file_name" {
  value = local_file.hello.filename
}

output "file_content" {
  value = local_file.hello.content
}