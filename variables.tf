
variable "client_id" {
  description = "Client ID - use dsol for internal resources. Used in all name prefixes."
  type        = string
}

variable "deployment_id" {
  description = "The deployment/application ID to be used across stack resources."
  type        = string
}

variable "environment" {
  type        = string
  description = "Deployment environment, defaults to terraform.workspace. Used in all name prefixes."
  default     = null
}

variable "owner" {
  description = "Technical owner of the resources."
  type        = string
}


variable "projects_to_create" {
  description = "The CodeBuild Projects that will be created."
  default     = ["pytest", "python_package_builder"]
  type        = list(string)

  validation {
    condition = alltrue([
      for project in var.projects_to_create: contains(["pytest", "python_package_builder"], project)
    ])
    error_message = "Projects to create must be one or more of the following [`pytest`, `python_package_builder`]."
  }
  validation {
    condition = length(var.projects_to_create) > 0
    error_message = "At least 1 Project must be created when using this module."
  }
}

variable "python_version" {
  description = "The version of Python that will be used for the Projects. Can be overridden via the `PYTHON_VERSION` env variable on the CodePipeline action block."
  default     = "3.8"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "List of VPC Security Groups that will provide ingress/egress for CodeBuild."
  type        = list(string)
}

variable "vpc_subnet_ids" {
  description = "List of VPC Subnets where CodeBuild traffic will originate."
  type        = list(string)
}
