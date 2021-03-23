variable "aws_role" {
}

variable "domain_name" {
}

variable "spacelift_stack_id" {
}

provider "aws" {
  region = "us-east-1"
}

provider "spacelift" {}
