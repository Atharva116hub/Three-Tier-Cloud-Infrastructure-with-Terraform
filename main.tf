module "vpc" {
    source = "./modules/vpc"  
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

