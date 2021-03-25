module "instances" {
  source           = "./environments"
  current_stack_id = var.current_stack_id
  aws_role         = var.aws_role
  certificate_arn  = aws_acm_certificate.endpoint-certificate.arn
  domain_name      = var.domain_name
  push_policy_id   = spacelift_policy.push-policy.id

  providers = {
    spacelift = spacelift
  }
}

// You can put common dependencies of all preview environments here.
// In this case, we create a policy and a wildcard certificate.

resource "spacelift_policy" "push-policy" {
  name = "Demo Preview Environments Environment Push Policy"
  type = "GIT_PUSH"
  body = file("${path.module}/policies/push-policy.rego")
}

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
  zone_id = var.domain_name_zone_id
}

resource "aws_api_gateway_domain_name" "endpoint" {
  provider = aws.eu-west-1

  certificate_arn = aws_acm_certificate.endpoint-certificate.arn
  domain_name     = "*.${var.domain_name}"
  security_policy = "TLS_1_2"
}

resource "aws_route53_record" "endpoint" {
  provider = aws.us-east-1

  name    = "*.${var.domain_name}"
  type    = "A"
  zone_id = var.domain_name_zone_id

  alias {
    evaluate_target_health = true
    name                   = aws_api_gateway_domain_name.endpoint.cloudfront_domain_name
    zone_id                = aws_api_gateway_domain_name.endpoint.cloudfront_zone_id
  }
}

