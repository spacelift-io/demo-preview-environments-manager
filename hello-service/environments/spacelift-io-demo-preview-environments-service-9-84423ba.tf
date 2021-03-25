module "spacelift-io-demo-preview-environments-service-9-84423ba" {
  source = "../template"

  manager_stack_id        = var.current_stack_id
  infra_repository_branch = "master"
  aws_role                = var.aws_role
  certificate_arn         = var.certificate_arn
  code_version            = "781e1cf6e45825c03a811830a428dce449c82b3d"
  domain_name             = var.domain_name
  environment             = "84423ba"
  push_policy_id          = var.push_policy_id

  providers = {
    spacelift = spacelift
  }
}