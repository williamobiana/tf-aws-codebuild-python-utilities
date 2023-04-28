
locals {
  prefix      = "${local.environment}-${var.client_id}"
  environment = var.environment == null ? terraform.workspace : var.environment
  default_tags = {
    client        = var.client_id
    deployment_id = var.deployment_id
    environment   = local.environment
    owner         = var.owner
  }
  default_env_vars = [
    { name : "PYTHON_VERSION", value : var.python_version },
    { name : "REQUIREMENTS_FILE", value : "requirements.txt" },
    { name : "S3_ARTIFACT_BUCKET_NAME", value : data.aws_s3_bucket.artifacts.id },
  ]
}

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

data "aws_s3_bucket" "artifacts" {
  bucket = "${data.aws_caller_identity.current.id}-prd-operations-artifacts"
}