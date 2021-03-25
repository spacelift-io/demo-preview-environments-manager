module "spacelift-io-demo-preview-environments-service-10-475ed74" {
  source = "../template"

  manager_stack_id        = var.current_stack_id
  infra_repository_branch = "master"
  aws_role                = var.aws_role
  certificate_arn         = var.certificate_arn
  code_version            = "68a0e427aba817ba6f79a76f71c0f0ad710735db"
  domain_name             = var.domain_name
  environment             = "475ed74"
  push_policy_id          = var.push_policy_id

  providers = {
    spacelift = spacelift
  }
}