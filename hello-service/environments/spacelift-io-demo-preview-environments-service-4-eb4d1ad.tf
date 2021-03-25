module "spacelift-io-demo-preview-environments-service-4-eb4d1ad" {
  source = "../template"

  manager_stack_id        = var.current_stack_id
  infra_repository_branch = "master"
  aws_role                = var.aws_role
  certificate_arn         = var.certificate_arn
  code_version            = "0392b7175adb3045faf7feeac1d771cee781c0d9"
  domain_name             = var.domain_name
  environment             = "eb4d1ad"
  push_policy_id          = var.push_policy_id

  providers = {
    spacelift = spacelift
  }
}