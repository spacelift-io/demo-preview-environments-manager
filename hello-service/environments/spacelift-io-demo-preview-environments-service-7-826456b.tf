module "spacelift-io-demo-preview-environments-service-7-826456b" {
  source = "../template"

  manager_stack_id        = var.current_stack_id
  infra_repository_branch = "master"
  aws_role                = var.aws_role
  certificate_arn         = var.certificate_arn
  code_version            = "aaaabc5efed3fc61b7529975b8fc345ae79fb02a"
  domain_name             = var.domain_name
  environment             = "826456b"
  push_policy_id          = var.push_policy_id

  providers = {
    spacelift = spacelift
  }
}