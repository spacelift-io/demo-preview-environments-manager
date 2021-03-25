module "spacelift-io-demo-preview-environments-infra-7-a2f27cb" {
  source = "../template"

  manager_stack_id        = var.current_stack_id
  infra_repository_branch = "hello-to-greetings"
  aws_role                = var.aws_role
  certificate_arn         = var.certificate_arn
  code_version            = "latest"
  domain_name             = var.domain_name
  environment             = "a2f27cb"
  push_policy_id          = var.push_policy_id

  providers = {
    spacelift = spacelift
  }
}