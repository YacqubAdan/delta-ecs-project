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
  source            = "./modules/alb"
  alb_name          = "delta-alb"
  alb_sg_id         = module.vpc.alb_sg_id
  vpc_id            = module.vpc.vpc_id
  tg_name           = "delta-tg"
  public_subnet_ids = module.vpc.public_subnet_id
  tg_port           = 3000
}

module "ecs" {
  source         = "./modules/ecs"
  vpc_id         = module.vpc.vpc_id
  ecs_sg_id      = module.vpc.ecs_sg_id
  alb_sg_id      = module.vpc.alb_sg_id
  http_listen_id = module.alb.http_listen_id
  subnet_ids     = module.vpc.public_subnet_id
  tg_arn         = module.alb.tg_arn
  container_img  = "582139844732.dkr.ecr.eu-west-2.amazonaws.com/delta-videos"
  desired_count  = 1
  container_port = 3000
  host_port      = 3000
  memory         = "4096"
  cpu            = "2048"
}

module "route53" {
  source         = "./modules/route53"
  dns_name       = "deltatv.yacquub.com"
  alb_zone_id    = module.alb.alb_zone_id
  alb_dns        = module.alb.alb_dns
  dns_record_ttl = 3000
}


module "acm" {
  source    = "./modules/acm"
  main_fqdn = module.route53.main_fqdn
  dns_name  = "deltatv.yacquub.com"
}

