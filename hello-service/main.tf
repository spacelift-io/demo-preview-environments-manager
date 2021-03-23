module "instances" {
  source = "./instances"
  current_stack_id = var.current_stack_id
  aws_role = var.aws_role
  certificate_arn = aws_acm_certificate.endpoint-certificate.arn
  domain_name = var.domain_name
  domain_name_zone_id = var.domain_name_zone_id

  providers = {
    spacelift = spacelift
  }
}

// You can put common dependencies of all preview environments here.
// In this case, we create a wildcard certificate.

resource "aws_acm_certificate" "endpoint-certificate" {
  provider = aws.us-east-1

  domain_name       = "*.${var.domain_name}"
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "endpoint-certificate" {
  provider = aws.us-east-1

  for_each = {
  for dvo in aws_acm_certificate.endpoint-certificate.domain_validation_options : dvo.domain_name => {
    name   = dvo.resource_record_name
    record = dvo.resource_record_value
    type   = dvo.resource_record_type
  }
  }

  allow_overwrite = true
  name            = each.value.name
  records = [
    each.value.record]
  ttl     = 60
  type    = each.value.type
  zone_id = data.aws_route53_zone.liftspace.zone_id
}
