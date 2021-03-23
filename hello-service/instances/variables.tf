variable "aws_role" {
}

variable "certificate_arn" {
}

variable "domain_name" {
}

variable "current_stack_id" {
}

terraform {
  required_providers {
    spacelift = {
      source = "spacelift.io/spacelift-io/spacelift"
    }
  }
}

provider "spacelift" {}
