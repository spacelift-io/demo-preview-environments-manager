module "spacelift-io-demo-preview-environments-service-5-9e94752" {
  source = "../template"

  manager_stack_id        = var.current_stack_id
  infra_repository_branch = "master"
  aws_role                = var.aws_role
  certificate_arn         = var.certificate_arn
  code_version            = "624077a140c4c5bdaf129e603019e8bf3565b4a7"
  domain_name             = var.domain_name
  environment             = "9e94752"
  push_policy_id          = var.push_policy_id

  providers = {
    spacelift = spacelift
  }
}