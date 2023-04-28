
module "pytest" {
  source        = "git::https://github.com/mudano-data-solutions/tf-aws-codebuild.git"
  count         = contains(var.projects_to_create, "pytest") ? 1 : 0
  client_id     = var.client_id
  deployment_id = var.deployment_id
  environment   = var.environment
  owner         = var.owner

  environment_variables  = local.default_env_vars
  name                   = "pytest"
  source_buildspec       = file("${path.module}/buildspecs/pytest.yml")
  timeout                = 60
  vpc_security_group_ids = var.vpc_security_group_ids
  vpc_subnet_ids         = var.vpc_subnet_ids
}

module "python_package_builder" {
  source        = "git::https://github.com/mudano-data-solutions/tf-aws-codebuild.git"
  count         = contains(var.projects_to_create, "python_package_builder") ? 1 : 0
  client_id     = var.client_id
  deployment_id = var.deployment_id
  environment   = var.environment
  owner         = var.owner

  environment_variables  = concat(
    local.default_env_vars,
    [
    { name : "PACKAGE_DIR", value : "./" },

    ]
  )
  name                   = "python-package-builder"
  source_buildspec       = file("${path.module}/buildspecs/python-package-builder.yml")
  timeout                = 60
  vpc_security_group_ids = var.vpc_security_group_ids
  vpc_subnet_ids         = var.vpc_subnet_ids
}
