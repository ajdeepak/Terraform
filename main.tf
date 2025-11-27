module "network" {
  source              = "./modules/network"
  vpccidr             = var.vpccidr
  azs                 = var.azs
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
}

module "compute" {
  source                = "./modules/compute"
  ami_id                = var.ami_id
  instance_type         = var.instance_type
  public_subnet_id      = module.network.public_subnet_ids[0]
  private_subnet_ids    = module.network.private_subnet_ids
  aws_security_group_id = module.alb.alb_Security_group_id
  vpc_id                = var.vpc_id
  alb_Security_group_id = module.alb.alb_Security_group_id

}

module "alb" {
  source            = "./modules/alb"
  vpc_id            = var.vpc_id
  public_subnet_ids = module.network.public_subnet_ids
  webapp_ids        = module.compute.webapp_ids

}
