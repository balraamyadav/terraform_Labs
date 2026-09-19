terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

# Read an existing Docker image
data "docker_image" "nginx" {
  name = "nginx:latest"
}

# Create a container using the image information
# retrieved by the data source
resource "docker_container" "nginx" {
  name  = "terraform-data-nginx"
  image = data.docker_image.nginx.name

  ports {
    internal = 80
    external = 8080
  }
}