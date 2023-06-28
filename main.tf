module "vpc" {
  source                       = "./modules/vpc"
  region                       = var.region
  project_name                 = var.project_name
  environment                  = var.environment
  vpc_cidr                     = var.vpc_cidr
  public_subnet_az1_cidr       = var.public_subnet_az1_cidr
  public_subnet_az2_cidr       = var.public_subnet_az2_cidr
  private_app_subnet_az1_cidr  = var.private_app_subnet_az1_cidr
  private_app_subnet_az2_cidr  = var.private_app_subnet_az2_cidr
  private_data_subnet_az1_cidr = var.private_data_subnet_az1_cidr
  private_data_subnet_az2_cidr = var.private_data_subnet_az2_cidr
}


module "security-group" {
  source = "./modules/security-group"
  vpc_id = module.vpc.vpc_id
}

module "elastic-beanstalk" {
  source                  = "./modules/elastic-beanstalk"
  vpc_id                  = module.vpc.vpc_id
  asg_private_subnet      = join(",",[module.vpc.private_app_subnet_az1_id, module.vpc.private_app_subnet_az2_id])
  elb_public_subnet       = join(",",[module.vpc.public_subnet_az1_id, module.vpc.public_subnet_az2_id])
  db_private_subnet       = join(",",[module.vpc.private_data_subnet_az1_id, module.vpc.private_data_subnet_az2_id])
  instance_type           = var.instance_type
  asg_security_group      = module.security-group.webserver-security-group_id
  min_size                = var.min_size
  max_size                = var.max_size
  availability_zone_names = join(",",[module.vpc.availability_zone_1, module.vpc.availability_zone_2])
  elb_security_group      = module.security-group.alb-security-group_id
  instance_class          = var.instance_class
  db_username             = var.db_username
  db_password             = var.db_password
}