variable "infra_repository_branch" {}
variable "manager_stack_id" {}
variable "code_version" {}
variable "domain_name" {}
variable "environment" {}

terraform {
  required_providers {
    spacelift = {
      source = "spacelift.io/spacelift-io/spacelift"
    }
  }
}

provider "spacelift" {}
