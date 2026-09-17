terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

provider "local" {}

resource "local_file" "hello" {
  filename = "${path.module}/${var.filename}"
  content  = var.content
}
# resource "local_file" "practice" {
#   count    = 3
#   filename = "${path.module}/practice-${count.index}.txt"
#   content  = "Terraform practice file ${count.index}"
# }


resource "local_file" "practice" {
  for_each = toset(["dev", "qa", "prod"])

  filename = "${path.module}/${each.key}.txt"
  content  = "Environment: ${each.key}"
}





