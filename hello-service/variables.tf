variable "aws_role" {}
variable "domain_name" {}
variable "domain_name_zone_id" {}
variable "current_stack_id" {}

provider "aws" {
  alias = "eu-west-1"
}

provider "aws" {
  alias = "us-east-1"
}

terraform {
  required_providers {
    spacelift = {
      source = "spacelift.io/spacelift-io/spacelift"
    }
  }
}

provider "spacelift" {
}
