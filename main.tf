terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

resource "docker_network" "app_network" {
  name = var.network_name
}

resource "docker_image" "nginx" {
  name = var.nginx_image
}

resource "docker_container" "nginx" {
  for_each = var.containers

  name  = "terraform-nginx-${each.key}"
  image = docker_image.nginx.image_id

  networks_advanced {
    name = docker_network.app_network.name
  }

  ports {
    internal = var.internal_port
    external = each.value
  }
}