module "spacelift-io-demo-preview-environments-service-8-50dc222" {
  source = "../template"

  manager_stack_id        = var.current_stack_id
  infra_repository_branch = "master"
  aws_role                = var.aws_role
  certificate_arn         = var.certificate_arn
  code_version            = "3ddf5d65425622a6755829fca9f2133de6b53567"
  domain_name             = var.domain_name
  environment             = "50dc222"
  push_policy_id          = var.push_policy_id

  providers = {
    spacelift = spacelift
  }
}