variable "manager_stack_id" {}
variable "infra_repository_branch" {}
variable "aws_role" {}
variable "certificate_arn" {}
variable "code_version" {}
variable "domain_name" {}
variable "environment" {}

terraform {
  required_providers {
    spacelift = {
      source = "downloads.spacelift.dev/spacelift-io/spacelift"
    }
  }
}

provider "spacelift" {}
