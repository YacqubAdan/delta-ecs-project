resource "aws_acm_certificate" "delta-acm" {
  domain_name       = var.dns_name
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "delta-acm-val" {
  certificate_arn         = aws_acm_certificate.delta-acm.arn
  validation_record_fqdns = [aws_route53_record.dns-validation-main.fqdn]
}


data "aws_route53_zone" "dns-zone" {
  name = var.dns_name
}

resource "aws_route53_record" "dns-validation-main" {
  allow_overwrite = true
  name            = tolist(aws_acm_certificate.delta-acm.domain_validation_options)[0].resource_record_name
  records         = [tolist(aws_acm_certificate.delta-acm.domain_validation_options)[0].resource_record_value]
  type            = tolist(aws_acm_certificate.delta-acm.domain_validation_options)[0].resource_record_type
  zone_id         = data.aws_route53_zone.dns-zone.zone_id
  ttl             = var.dns_record_ttl
}