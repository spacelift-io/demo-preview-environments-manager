module "hello-service" {
  source = "./hello-service"

  aws_role = var.aws_role
  current_stack_id = var.spacelift_stack_id
  domain_name = "hello-service.preview-environments.${var.domain_name}"
  domain_name_zone_id = data.aws_route53_zone.liftspace.zone_id

  providers = {
    aws.us-east-1 = aws
    spacelift = spacelift
  }
}

data "aws_route53_zone" "liftspace" {
  name = "${var.domain_name}."
}
