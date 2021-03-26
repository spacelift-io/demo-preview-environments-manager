module "spacelift-io-demo-preview-environments-service-11-46a5fa6" {
  source = "../template"

  manager_stack_id        = var.current_stack_id
  infra_repository_branch = "master"
  aws_role                = var.aws_role
  certificate_arn         = var.certificate_arn
  code_version            = "63c45f97f39bbb4e79d6e42761412afb74c54c9c"
  domain_name             = var.domain_name
  environment             = "46a5fa6"
  push_policy_id          = var.push_policy_id

  providers = {
    spacelift = spacelift
  }
}