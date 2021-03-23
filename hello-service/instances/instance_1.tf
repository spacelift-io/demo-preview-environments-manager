module "preview-environment-42" {
  source = "../template"

  code_version = "f541fdef95a91a90e1e0c768f8a9e8ecbc3a22c0"
  domain_name = var.domain_name
  environment = "ddccbbaa"
  infra_repository_branch = "master"

  providers = {
    spacelift = spacelift
  }
}
