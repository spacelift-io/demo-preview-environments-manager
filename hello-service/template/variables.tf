variable "manager_stack_id" {}
variable "infra_repository_branch" {}
variable "aws_role" {}
variable "certificate_arn" {}
variable "code_version" {}
variable "domain_name" {}
variable "environment" {}
variable "push_policy_id" {}

terraform {
  required_providers {
    spacelift = {
      source = "spacelift.io/spacelift-io/spacelift"
    }
  }
}

provider "spacelift" {}
