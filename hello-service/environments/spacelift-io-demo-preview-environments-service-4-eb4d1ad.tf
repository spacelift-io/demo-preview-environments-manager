module "spacelift-io-demo-preview-environments-service-4-eb4d1ad" {
  source = "../template"

  manager_stack_id        = var.current_stack_id
  infra_repository_branch = "master"
  aws_role                = var.aws_role
  certificate_arn         = var.certificate_arn
  code_version            = "bbc9ff00a7cf903284fe980bdb666b68d102e425"
  domain_name             = var.domain_name
  environment             = "eb4d1ad"
  push_policy_id          = var.push_policy_id

  providers = {
    spacelift = spacelift
  }
}