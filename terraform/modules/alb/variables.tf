variable "alb_sg_id" {
  type        = string
  description = "The id of the security group"
}

variable "public_subnet_ids" {
    type = list(string)
    description = "The id of the public subnets"
}

variable "delta_alb_name" {
  type = string
  description = "The name of the alb"
}