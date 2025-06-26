module "vpc" {
  source                = "./modules/vpc"
  name                  = var.vpc_name
  cidr                  = var.vpc_cidr
  azs                   = var.azs
  public_subnet_cidrs   = var.public_subnet_cidrs
  private_subnet_cidrs  = var.private_subnet_cidrs
  enable_nat_gateway    = var.enable_nat_gateway
  single_nat_gateway    = var.single_nat_gateway
  enable_dns_hostnames  = var.enable_dns_hostnames
}


module "sg" {
    source = "./modules/sg"
    vpc_id = module.vpc.vpc_id
}

module "ec2" {
    source  = "./modules/ec2"
    subnet_id = module.vpc.public_subnets[0]
    vpc_security_groups = [module.sg.security_group_id]
    key_name = var.key_name 
    instance_type = var.instance_type 
}

module "rds" {
    source = "./modules/rds"
    private_subnets = module.vpc.private_subnets
    vpc_security_groups = [module.sg.security_group_id]
  
}

module "alb" {
    source = "./modules/alb"
    vpc_id = module.vpc.vpc_id
    public_subnets = module.vpc.public_subnets
    ec2_instance_ids = [module.ec2.instance_id]

}

