locals {
  environment  = "dev"
  project_name = "terraform"
  application  = "nginx"

  environment_upper = upper(local.environment)

  container_prefix = join(
    "-",
    [
      local.project_name,
      local.application
    ]
  )

  network_name = format(
    "%s-%s-network",
    local.container_prefix,
    local.environment
  )

  common_labels = {
    environment = local.environment
    project     = local.project_name
    application = local.application
    managed_by  = "terraform"
  }
}