output "route53_zone_id" {
  description = "The id of the Route53 Zone"
  value       = data.aws_route53_zone.dns-zone.zone_id
}

output "main_domain" {
  description = "The main domain"
  value       = var.dns_name

}
