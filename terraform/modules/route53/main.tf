data "aws_route53_zone" "dns-zone" {
  name = "deltavids.yacquub.com"
}

resource "aws_route53_record" "main-record" {
  zone_id = data.aws_route53_zone.dns-zone.zone_id
  name    = var.dns_name
  type    = "A"
  alias {
    name                   = var.alb_dns
    zone_id                = var.alb_zone_id
    evaluate_target_health = true
  }
}
