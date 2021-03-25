module "spacelift-io-demo-preview-environments-infra-6-e6c733e" {
  source = "../template"

  manager_stack_id        = var.current_stack_id
  infra_repository_branch = "hello-to-greetings"
  aws_role                = var.aws_role
  certificate_arn         = var.certificate_arn
  code_version            = "latest"
  domain_name             = var.domain_name
  environment             = "e6c733e"
  push_policy_id          = var.push_policy_id

  providers = {
    spacelift = spacelift
  }
}