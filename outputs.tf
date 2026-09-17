output "network_name" {
  value = docker_network.app_network.name
}

output "container_name" {
  value = docker_container.nginx.name
}

output "container_id" {
  value = docker_container.nginx.id
}