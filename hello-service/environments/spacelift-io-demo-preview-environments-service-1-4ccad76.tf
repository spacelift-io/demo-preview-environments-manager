aamodule "spacelift-io-demo-preview-environments-service-1-4ccad76" {
  source = "../template"

  manager_stack_id        = var.current_stack_id
  infra_repository_branch = "master"
  aws_role                = var.aws_role
  certificate_arn         = var.certificate_arn
  code_version            = "1e7f633c6e1b00410d3635ec1a2bbe0c26e39edc"
  domain_name             = var.domain_name
  domain_name_zone_id     = var.domain_name_zone_id
  environment             = "4ccad76"

  providers = {
    spacelift = spacelift
  }
}