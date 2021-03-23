variable "aws_role" {
}

variable "domain_name" {
}

variable "spacelift_stack_id" {
}

provider "aws" {
  region = "us-east-1"
}

terraform {
  required_providers {
    spacelift = {
      source = "spacelift.io/spacelift-io/spacelift"
    }
  }
}

provider "spacelift" {}
