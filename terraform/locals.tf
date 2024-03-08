locals {
  short_project_name = var.short_project_name
  project_name       = var.project_name
  stage              = var.stage
  location           = var.location
  version            = 1
  name_prefix        = "${local.short_project_name}${local.stage}${local.version}"
  tags = {
    project_name       = var.PROJECT_NAME
    short_project_name = var.SHORT_PROJECT_NAME
    version            = local.version
    infrastructure     = "core"
    stage              = local.stage
  }
}
