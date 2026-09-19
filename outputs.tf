output "container_name" {
  description = "Name of the Nginx container"
  value       = docker_container.nginx.name
}

output "container_id" {
  description = "ID of the Nginx container"
  value       = docker_container.nginx.id
}

output "image_name" {
  description = "Nginx image read using data source"
  value       = data.docker_image.nginx.name
}

output "nginx_url" {
  description = "Nginx application URL"
  value       = "http://localhost:8080"
}
