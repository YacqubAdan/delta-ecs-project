module "vpc" {
  source                    = "./modules/vpc"
  vpc_name                  = var.vpc_name
  vpc_cidr_block            = var.vpc_cidr_block
  public_subnet_cidrs       = var.public_subnet_cidrs
  subnet_availability_zones = var.subnet_availability_zones
  ecs_sg_name               = "ecs-security-group"
  alb_sg_name               = "alb-security-group"
}

module "alb" {
  source            = "./modules/alb"
  alb_name          = var.alb_name
  alb_sg_id         = module.vpc.alb_sg_id
  vpc_id            = module.vpc.vpc_id
  tg_name           = var.tg_name
  public_subnet_ids = module.vpc.public_subnet_id
  tg_port           = 3000
  certificate_arn   = module.acm.certificate_arn
}

module "ecs" {
  source         = "./modules/ecs"
  ecs_name       = var.ecs_name
  ecs_family     = var.ecs_family
  service_name   = var.service_name
  vpc_id         = module.vpc.vpc_id
  ecs_sg_id      = module.vpc.ecs_sg_id
  alb_sg_id      = module.vpc.alb_sg_id
  http_listen_id = module.alb.http_listen_id
  subnet_ids     = module.vpc.public_subnet_id
  tg_arn         = module.alb.tg_arn
  container_img  = "582139844732.dkr.ecr.eu-west-2.amazonaws.com/delta-videos"
  exec_role      = var.exec_role
  desired_count  = 1
  container_port = 3000
  host_port      = 3000
  memory         = var.memory
  cpu            = var.cpu
}

module "route53" {
  source      = "./modules/route53"
  dns_name    = var.dns_name
  alb_zone_id = module.alb.alb_zone_id
  alb_dns     = module.alb.alb_dns
}


module "acm" {
  source         = "./modules/acm"
  dns_name       = var.dns_name
  dns_record_ttl = 3000
}

