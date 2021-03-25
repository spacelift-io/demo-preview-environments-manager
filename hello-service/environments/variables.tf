variable "aws_role" {}
variable "certificate_arn" {}
variable "domain_name" {}
variable "domain_name_zone_id" {}
variable "current_stack_id" {}

terraform {
  required_providers {
    spacelift = {
      source = "downloads.spacelift.dev/spacelift-io/spacelift"
    }
  }
}

provider "spacelift" {}
