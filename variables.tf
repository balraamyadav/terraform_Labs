variable "container_name" {
  description = "Name of the Docker container"
  type        = string
  default     = "terraform-nginx"
}

variable "network_name" {
  description = "Name of the Docker network"
  type        = string
  default     = "terraform-app-network"
}

variable "external_port" {
  description = "External port for Nginx"
  type        = number
  default     = 8080
}

variable "internal_port" {
  description = "Internal Nginx container port"
  type        = number
  default     = 80
}

variable "nginx_image" {
  description = "Docker image for Nginx"
  type        = string
  default     = "nginx:latest"
}

variable "container_count" {
  description = "Number of Nginx containers"
  type        = number
  default     = 3
}