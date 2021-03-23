variable "aws_role" {
}

variable "domain_name" {
}

variable "current_stack_id" {
}

provider "aws" {
  alias = "us-east-1"
}

provider "spacelift" {
}
