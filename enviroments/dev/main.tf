# environments/dev/main.tf

module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr             = var.vpc_cidr
  public_subnet_1_cidr = var.public_subnet_1_cidr
  public_subnet_2_cidr = var.public_subnet_2_cidr
  private_subnet_cidr  = var.private_subnet_cidr
  env                  = var.env
}

module "asg" {
  source = "../../modules/asg"

  env           = var.env
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  
  # Dynamic values coming from other modules
  sg_id         = module.vpc.sg_id
  subnet_ids    = module.vpc.public_subnet_ids
  tg_arn        = module.alb.tg_arn
}

module "alb" {
  source = "../../modules/alb"

  env        = var.env
  subnet_ids = module.vpc.public_subnet_ids
  sg_id      = module.vpc.sg_id
  vpc_id     = module.vpc.vpc_id
}