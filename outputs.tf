output "container_names" {
  description = "Names of the Nginx containers"
  value       = docker_container.nginx[*].name
}

output "container_ids" {
  description = "IDs of the Nginx containers"
  value       = docker_container.nginx[*].id
}

output "nginx_urls" {
  description = "URLs of the Nginx containers"
  value = [
    for index in range(var.container_count) :
    "http://localhost:${var.external_port + index}"
  ]
}