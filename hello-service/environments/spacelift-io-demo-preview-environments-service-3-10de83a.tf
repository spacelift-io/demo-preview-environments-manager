module "spacelift-io-demo-preview-environments-service-3-10de83a" {
  source = "../template"

  manager_stack_id        = var.current_stack_id
  infra_repository_branch = "master"
  aws_role                = var.aws_role
  certificate_arn         = var.certificate_arn
  code_version            = "59f989712e217d4f1bd2b4ae1edc907105713e89"
  domain_name             = var.domain_name
  environment             = "10de83a"
  push_policy_id          = var.push_policy_id

  providers = {
    spacelift = spacelift
  }
}