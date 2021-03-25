variable "current_stack_id" {}
variable "aws_role" {}
variable "certificate_arn" {}
variable "domain_name" {}
variable "push_policy_id" {}

terraform {
  required_providers {
    spacelift = {
      source = "downloads.spacelift.dev/spacelift-io/spacelift"
    }
  }
}

provider "spacelift" {}
