module "spacelift-io-demo-preview-environments-infra-2-63d267b" {
  source = "../template"

  manager_stack_id        = var.current_stack_id
  infra_repository_branch = "cube2222-patch-2"
  aws_role                = var.aws_role
  certificate_arn         = var.certificate_arn
  code_version            = "latest"
  domain_name             = var.domain_name
  environment             = "63d267b"

  providers = {
    spacelift = spacelift
  }
}