output "alb_arn" {
  value       = aws_lb.delta-alb.arn
  description = "The arn of alb"
}

output "alb_dns" {
  value       = aws_lb.delta-alb.dns_name
  description = "The dns of the alb"
}

output "alb_url" {
  value       = "https://${aws_lb.delta-alb.dns_name}"
  description = "The url of the alb"
}

output "tg_arn" {
  value       = aws_lb_target_group.delta-tg.arn
  description = "The arn of target group"
}

output "http_listen" {
  value       = aws_lb_listener.delta-listener-http.id
  description = "The id of http listener"
}


output "alb_zone_id" {
  value       = aws_lb.delta-alb.zone_id
  description = "The zone id of alb"
}