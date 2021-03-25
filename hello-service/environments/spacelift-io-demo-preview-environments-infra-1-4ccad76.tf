module "spacelift-io-demo-preview-environments-infra-1-4ccad76" {
  source = "../template"

  manager_stack_id        = var.current_stack_id
  infra_repository_branch = "cube2222-patch-1"
  aws_role                = var.aws_role
  code_version            = "latest"
  domain_name             = var.domain_name
  environment             = "4ccad76"

  providers = {
    spacelift = spacelift
  }
}