resource "spacelift_stack" "preview-stack" {
  name = "Demo Preview Environments Hello Service ${var.environment}"

  administrative = true
  autodeploy = true
  branch = var.infra_repository_branch
  repository = "demo-preview-environments-infra"

  labels = [
    "preview-environment-managed-by:${var.manager_stack_id}",
    "destroy_on_delete",
    "preview_environment_id:${var.environment}"
  ]
}

resource "spacelift_environment_variable" "certificate_arn" {
  stack_id = spacelift_stack.preview-stack.id
  name = "TF_VAR_certificate_arn"
  value = var.code_version
  write_only = false
}

resource "spacelift_environment_variable" "code_version" {
  stack_id = spacelift_stack.preview-stack.id
  name = "TF_VAR_code_version"
  value = var.code_version
  write_only = false
}

resource "spacelift_environment_variable" "domain_name" {
  stack_id = spacelift_stack.preview-stack.id
  name = "TF_VAR_domain_name"
  value = var.code_version
  write_only = false
}

resource "spacelift_environment_variable" "environment" {
  stack_id = spacelift_stack.preview-stack.id
  name = "TF_VAR_environment"
  value = var.environment
  write_only = false
}