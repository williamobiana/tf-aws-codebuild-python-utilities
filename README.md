# AWS x Terraform Module

[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

## Overview
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_client_id"></a> [client_id](#input_client_id) | Client ID - use dsol for internal resources. Used in all name prefixes. | `string` | n/a | yes |
| <a name="input_deployment_id"></a> [deployment_id](#input_deployment_id) | The deployment/application ID to be used across stack resources. | `string` | n/a | yes |
| <a name="input_owner"></a> [owner](#input_owner) | Technical owner of the resources. | `string` | n/a | yes |
| <a name="input_vpc_security_group_ids"></a> [vpc_security_group_ids](#input_vpc_security_group_ids) | List of VPC Security Groups that will provide ingress/egress for CodeBuild. | `list(string)` | n/a | yes |
| <a name="input_vpc_subnet_ids"></a> [vpc_subnet_ids](#input_vpc_subnet_ids) | List of VPC Subnets where CodeBuild traffic will originate. | `list(string)` | n/a | yes |
| <a name="input_environment"></a> [environment](#input_environment) | Deployment environment, defaults to terraform.workspace. Used in all name prefixes. | `string` | `null` | no |
| <a name="input_projects_to_create"></a> [projects_to_create](#input_projects_to_create) | The CodeBuild Projects that will be created. | `list(string)` | <pre>[<br>  "pytest",<br>  "python_package_builder"<br>]</pre> | no |
| <a name="input_python_version"></a> [python_version](#input_python_version) | The version of Python that will be used for the Projects. Can be overridden via the `PYTHON_VERSION` env variable on the CodePipeline action block. | `string` | `"3.8"` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_pytest_project_name"></a> [pytest_project_name](#output_pytest_project_name) | Name of the Terraform apply CodeBuild Project. |
| <a name="output_python_package_builder_project_name"></a> [python_package_builder_project_name](#output_python_package_builder_project_name) | Name of the Terraform destroy CodeBuild Project. |
## Resources

| Name | Type |
|------|------|
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_pytest"></a> [pytest](#module_pytest) | git::https://github.com/mudano-data-solutions/tf-aws-codebuild.git | n/a |
| <a name="module_python_package_builder"></a> [python_package_builder](#module_python_package_builder) | git::https://github.com/mudano-data-solutions/tf-aws-codebuild.git | n/a |
## Usage

```hcl

```

## Documentation
We use a library called `terraform-docs` for automatically generating documentation for the variables, outputs, resources, and sub-modules defined within a Terraform module.   
The output from `terraform-docs` is wrapped between `HEADER.md` and `FOOTER.md` files which include custom module documentation and usage guidelines.

To ensure our documentation remains up-to-date, it is important that each time changes are made to a module the docs are updated by cd'ing into the module directory and running the following command:  

`terraform-docs --config docs/terraform-docs.yml markdown --escape=false . > README.md`
