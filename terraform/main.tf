module "vpc" {
  source                    = "./modules/vpc"
  vpc_name                  = "delta-vpc"
  vpc_cidr_block            = "10.0.0.0/16"
  public_subnet_cidrs       = ["10.0.1.0/24", "10.0.2.0/24"]
  subnet_availability_zones = ["eu-west-2a", "eu-west-2b"]
  ecs_sg_name               = "ecs-security-group"
  alb_sg_name               = "alb-security-group"
}