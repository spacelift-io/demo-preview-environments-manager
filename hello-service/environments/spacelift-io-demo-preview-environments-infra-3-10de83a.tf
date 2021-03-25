module "spacelift-io-demo-preview-environments-infra-3-10de83a" {
  source = "../template"

  manager_stack_id        = var.current_stack_id
  infra_repository_branch = "cube2222-patch-3"
  aws_role                = var.aws_role
  certificate_arn         = var.certificate_arn
  code_version            = "latest"
  domain_name             = var.domain_name
  environment             = "10de83a"

  providers = {
    spacelift = spacelift
  }
}