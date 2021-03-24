module "instance_1" {
  source = "../template"

  manager_stack_id        = var.current_stack_id
  infra_repository_branch = "master"
  aws_role                = var.aws_role
  certificate_arn         = var.certificate_arn
  code_version            = "2f90e7a5f99ca82b160f0d9da26a1c07b1d177ea"
  domain_name             = var.domain_name
  domain_name_zone_id     = var.domain_name_zone_id
  environment             = "4ccad76"

  providers = {
    spacelift = spacelift
  }
}