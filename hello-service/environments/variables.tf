variable "aws_role" {}
variable "domain_name" {}
variable "current_stack_id" {}

terraform {
  required_providers {
    spacelift = {
      source = "downloads.spacelift.dev/spacelift-io/spacelift"
    }
  }
}

provider "spacelift" {}
