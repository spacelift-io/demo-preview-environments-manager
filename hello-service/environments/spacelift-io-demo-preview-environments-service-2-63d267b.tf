module "spacelift-io-demo-preview-environments-service-2-63d267b" {
  source = "../template"

  manager_stack_id        = var.current_stack_id
  infra_repository_branch = "master"
  aws_role                = var.aws_role
  certificate_arn         = var.certificate_arn
  code_version            = "ad3f5a2ddf63280641aa095478ff37a56378511d"
  domain_name             = var.domain_name
  environment             = "63d267b"
  push_policy_id          = var.push_policy_id

  providers = {
    spacelift = spacelift
  }
}