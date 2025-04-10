variable "alb_name" {
  type        = string
  description = "The name of the ALB"
}

variable "alb_sg_id" {
  type        = string
  description = "The id of the security group"
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "The id of the public subnets"
}
variable "vpc_id" {
  type        = string
  description = "The id of the VPC"
}


variable "tg_name" {
  type        = string
  description = "The name of the target group"

}

variable "tg_port" {
  type        = number
  description = "The port of the target group"

}

variable "certificate_arn" {
  type        = string
  description = "The certificate ARN"
}