module "spacelift-io-demo-preview-environments-service-11-46a5fa6" {
  source = "../template"

  manager_stack_id        = var.current_stack_id
  infra_repository_branch = "master"
  aws_role                = var.aws_role
  certificate_arn         = var.certificate_arn
  code_version            = "1b79586184cdcf7a28b8c8275e7ffc2ce3eca912"
  domain_name             = var.domain_name
  environment             = "46a5fa6"
  push_policy_id          = var.push_policy_id

  providers = {
    spacelift = spacelift
  }
}