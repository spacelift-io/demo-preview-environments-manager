module "hello-service" {
  source = "./hello-service"

  aws_role            = var.aws_role
  current_stack_id    = var.spacelift_stack_id
  domain_name         = "hello-service.preview-environments.${var.domain_name}"
  domain_name_zone_id = data.aws_route53_zone.liftspace.zone_id

  providers = {
    aws.eu-west-1 = aws.eu-west-1
    aws.us-east-1 = aws.us-east-1
    spacelift     = spacelift
  }
}

data "aws_route53_zone" "liftspace" {
  provider = aws.us-east-1

  name = "${var.domain_name}."
}
