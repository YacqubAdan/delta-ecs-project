output "route53_zone_id" {
  description = "The id of the Route53 Zone"
  value       = data.aws_route53_zone.dns_zone.zone_id
}

output "root_domain" {
  description = "The main domain"
  value       = var.dns_name

}