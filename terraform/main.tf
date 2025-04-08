module "vpc" {
  source                    = "./modules/vpc"
  vpc_name                  = "delta-vpc"
  vpc_cidr_block            = "10.0.0.0/16"
  public_subnet_cidrs       = ["10.0.1.0/24", "10.0.2.0/24"]
  subnet_availability_zones = ["eu-west-2a", "eu-west-2b"]
  ecs_sg_name               = "ecs-security-group"
  alb_sg_name               = "alb-security-group"
}

module "alb" {
  source   = "./modules/alb"
  alb_name = "delta-alb"
  alb_sg_id = module.vpc.alb_sg_id
  vpc_id = module.vpc.vpc_id
  tg_name = "delta-tg"
  public_subnet_ids = module.vpc.public_subnet_id
  tg_port = 3000
}

