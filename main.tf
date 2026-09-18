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
  name = "${local.container_prefix}-${local.environment}-network"
}

resource "docker_image" "nginx" {
  name = var.nginx_image
}

resource "docker_container" "nginx" {
  for_each = var.containers

  name  = "${local.container_prefix}-${each.key}"
  image = docker_image.nginx.image_id

  networks_advanced {
    name = docker_network.app_network.name
  }

  ports {
    internal = var.internal_port
    external = each.value
  }

  labels {
    label = "environment"
    value = local.environment
  }

  labels {
    label = "project"
    value = local.project_name
  }

  labels {
    label = "application"
    value = local.application
  }

  labels {
    label = "managed_by"
    value = "terraform"
  }
}