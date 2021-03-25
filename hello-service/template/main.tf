resource "spacelift_stack" "hello-service" {
  name = "Demo Preview Environments Hello Service ${var.environment}"

  administrative = true
  autodeploy     = true
  branch         = var.infra_repository_branch
  repository     = "demo-preview-environments-infra"

  labels = [
    "preview-environment-managed-by:${var.manager_stack_id}",
    "destroy_on_delete",
    "preview_environment_id:${var.environment}"
  ]
}

resource "spacelift_aws_role" "hello-service" {
  stack_id = spacelift_stack.hello-service.id
  role_arn = var.aws_role
}

resource "spacelift_environment_variable" "aws_role" {
  stack_id   = spacelift_stack.hello-service.id
  name       = "TF_VAR_aws_role"
  value      = var.aws_role
  write_only = false
}

resource "spacelift_environment_variable" "code_version" {
  stack_id   = spacelift_stack.hello-service.id
  name       = "TF_VAR_code_version"
  value      = var.code_version
  write_only = false
}

resource "spacelift_environment_variable" "domain_name" {
  stack_id   = spacelift_stack.hello-service.id
  name       = "TF_VAR_domain_name"
  value      = var.domain_name
  write_only = false
}

resource "spacelift_environment_variable" "environment" {
  stack_id   = spacelift_stack.hello-service.id
  name       = "TF_VAR_environment"
  value      = var.environment
  write_only = false
}

resource "spacelift_stack_destructor" "hello-service" {
  depends_on = [
    spacelift_aws_role.hello-service,
    spacelift_environment_variable.aws_role,
    spacelift_environment_variable.code_version,
    spacelift_environment_variable.domain_name,
    spacelift_environment_variable.environment,
  ]
  stack_id = spacelift_stack.hello-service.id
}
