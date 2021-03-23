module "hello-service" {
  source = "./hello-service"

  aws_role = var.aws_role
  current_stack_id = var.spacelift_stack_id
  domain_name = "hello-service.${var.domain_name}"

  providers = {
    aws.us-east-1 = aws
    spacelift = spacelift
  }
}
