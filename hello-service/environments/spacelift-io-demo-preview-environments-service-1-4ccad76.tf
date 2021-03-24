aamodule "spacelift-io-demo-preview-environments-service-1-4ccad76" {
  source = "../template"

  manager_stack_id        = var.current_stack_id
  infra_repository_branch = "master"
  aws_role                = var.aws_role
  certificate_arn         = var.certificate_arn
  code_version            = "d870f53d1841597f522dc187e60bba58780d47ea"
  domain_name             = var.domain_name
  domain_name_zone_id     = var.domain_name_zone_id
  environment             = "4ccad76"

  providers = {
    spacelift = spacelift
  }
}