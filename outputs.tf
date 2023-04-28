
output "pytest_project_name" {
  description = "Name of the Terraform apply CodeBuild Project."
  value       = contains(var.projects_to_create, "pytest") ? module.pytest[0].name : null
}

output "python_package_builder_project_name" {
  description = "Name of the Terraform destroy CodeBuild Project."
  value       = contains(var.projects_to_create, "python_package_builder") ? module.python_package_builder[0].name : null
}
