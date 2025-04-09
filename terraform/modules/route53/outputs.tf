output "route53_zone_id" {
  description = "The id of the Route53 Zone"
  value       = data.aws_route53_zone.dns_zone.zone_id
}

output "main_domain" {
  description = "The main domain"
  value       = var.dns_name

}

output "main_fqdn" {
  description = "fqdn for main record"
  value       = var.aws_route53_record.dns-validation-main.fqdn

}
