module "instance_1" {
  source = "../template"

  manager_stack_id        = var.current_stack_id
  infra_repository_branch = "master"
  aws_role                = var.aws_role
  certificate_arn         = var.certificate_arn
  code_version            = "f541fdef95a91a90e1e0c768f8a9e8ecbc3a22c0"
  domain_name             = var.domain_name
  environment             = "ddccbbaa"

  providers = {
    spacelift = spacelift
  }
}
