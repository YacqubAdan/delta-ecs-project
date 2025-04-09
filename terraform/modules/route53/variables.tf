variable "dns_name" {
  type        = string
  description = "The name of the DNS"
}


variable "alb_dns" {
  type        = string
  description = "The DNS of the ALB"
}


variable "alb_zone_id" {
  type        = string
  description = "The id of the ALB"
}

variable "dns_record_ttl" {
  type        = number
  description = "The TTL for the DNS record"
}