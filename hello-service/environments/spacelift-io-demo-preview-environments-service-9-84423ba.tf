module "spacelift-io-demo-preview-environments-service-9-84423ba" {
  source = "../template"

  manager_stack_id        = var.current_stack_id
  infra_repository_branch = "master"
  aws_role                = var.aws_role
  certificate_arn         = var.certificate_arn
  code_version            = "3ff27ccbc9396536d9f7d605a4d42c4791cfa520"
  domain_name             = var.domain_name
  environment             = "84423ba"
  push_policy_id          = var.push_policy_id

  providers = {
    spacelift = spacelift
  }
}