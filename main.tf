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
  name = "terraform-lifecycle-network"
}

resource "docker_image" "nginx" {
  name = "nginx:latest"
}

resource "docker_container" "nginx" {
  name  = "terraform-lifecycle-nginx"
  image = docker_image.nginx.image_id

  networks_advanced {
    name = docker_network.app_network.name
  }

  ports {
    internal = 80
    external = 8080
  }

  lifecycle {
    create_before_destroy = true

    #prevent_destroy       = true
  }

  depends_on = [
    docker_network.app_network
  ]
}