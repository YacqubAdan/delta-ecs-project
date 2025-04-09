data "aws_route53_zone" "dns-zone" {
  name = var.dns_name
}

resource "aws_route53_record" "main-record" {
  zone_id = aws_route53_zone.dns-zone.zone_id
  name    = var.dns_name
  type    = "A"
  alias {
    name                   = var.alb_dns
    zone_id                = var.alb_zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "dns-validation-main" {
  allow_overwrite = true
  name            = tolist(aws_acm_certificate.ssl_cert.domain_validation_options)[0].resource_record_name
  records         = [tolist(aws_acm_certificate.ssl_cert.domain_validation_options)[0].resource_record_value]
  type            = tolist(aws_acm_certificate.ssl_cert.domain_validation_options)[0].resource_record_type
  zone_id         = data.aws_route53_zone.dns-zone.zone_id
  ttl             = var.dns_record_ttl
}