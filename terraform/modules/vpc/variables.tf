variable "vpc_cidr_block" {
  type        = string
  description = "The cidr block for vpc"
}

variable "vpc_name" {
  type        = string
  description = "The name tag for the VPC"
  default     = "delta-vpc"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "The cidr block for the public subnet"
}

variable "subnet_availability_zones" {
  type        = list(string)
  description = "The availability zones for the subnets"
}

variable "igw_name" {
  type        = string
  description = "Name of internet gateway"
  default     = "delta-igw"
}

variable "route_table_name" {
  type        = string
  description = "Name of route table"
  default     = "delta-rt"
}

variable "ecs_sg_name" {
  type        = string
  description = "The name of the security group"
}

variable "alb_sg_name" {
  type        = string
  description = "The name of the security group"
}


