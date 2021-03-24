aamodule "spacelift-io-demo-preview-environments-service-1-4ccad76" {
  source = "../template"

  manager_stack_id        = var.current_stack_id
  infra_repository_branch = "master"
  aws_role                = var.aws_role
  certificate_arn         = var.certificate_arn
  code_version            = "dfb89b5fd616b006da8065a12a4816e83cb377f5"
  domain_name             = var.domain_name
  domain_name_zone_id     = var.domain_name_zone_id
  environment             = "4ccad76"

  providers = {
    spacelift = spacelift
  }
}