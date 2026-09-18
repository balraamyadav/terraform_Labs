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
