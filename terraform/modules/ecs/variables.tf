variable "ecs_name" {
  type    = string
  default = "delta-ecs"
}

variable "service_name" {
  type    = string
  default = "delta-service"
}

variable "ecs_family" {
  type    = string
  default = "delta-task"
}

variable "desired_count" {
  type        = number
  description = "The desired count of ECS tasks"

}

variable "container_img" {
  type        = string
  description = "The container image uri"
}

variable "container_port" {
  type        = number
  description = "The port of the container"
}


variable "host_port" {
  type        = number
  description = "The host of the container"
}

variable "cpu" {
  type        = number
  description = "ECS Container CPU"
}

variable "memory" {
  type        = number
  description = "ECS Container memory"
}

variable "vpc_id" {
  type        = string
  description = "The id of the VPC"
}

variable "ecs_sg_id" {
  type        = string
  description = "The id of container security group"
}

variable "alb_sg_id" {
  type        = string
  description = "The id of load balancer security group"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnets for ECS service"
}

variable "tg_arn" {
  type        = string
  description = "The arn of target group"
}

variable "http_listen_id" {
  type        = string
  description = "The id of http listener"
}

variable "exec_role" {
  type        = string
  description = "Execution role for ECS"
}