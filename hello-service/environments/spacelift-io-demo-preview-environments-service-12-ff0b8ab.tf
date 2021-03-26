module "spacelift-io-demo-preview-environments-service-12-ff0b8ab" {
  source = "../template"

  manager_stack_id        = var.current_stack_id
  infra_repository_branch = "master"
  aws_role                = var.aws_role
  certificate_arn         = var.certificate_arn
  code_version            = "840991ab5725002c70b5c787411ca591eb5304b4"
  domain_name             = var.domain_name
  environment             = "ff0b8ab"
  push_policy_id          = var.push_policy_id

  providers = {
    spacelift = spacelift
  }
}