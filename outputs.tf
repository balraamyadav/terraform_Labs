output "container_names" {
  description = "Names of the Nginx containers"

  value = {
    for key, container in docker_container.nginx :
    key => container.name
  }
}

output "container_ids" {
  description = "IDs of the Nginx containers"

  value = {
    for key, container in docker_container.nginx :
    key => container.id
  }
}

output "nginx_urls" {
  description = "URLs of the Nginx containers"

  value = {
    for key, port in var.containers :
    key => "http://localhost:${port}"
  }
}

output "environment" {
  value = local.environment
}

output "environment_upper" {
  value = local.environment_upper
}

output "network_name" {
  value = local.network_name
}

output "container_prefix" {
  value = local.container_prefix
}