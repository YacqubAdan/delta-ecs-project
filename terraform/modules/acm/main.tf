resource "aws_acm_certificate" "delta-acm" {
  domain_name       = var.dns_name
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "delta-acm-val" {
  certificate_arn         = aws_acm_certificate.delta-acm.arn
  validation_record_fqdns = [var.main_fqdn]
}
