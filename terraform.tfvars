vpc_name              = "3tier-vpc"
vpc_cidr              = "10.0.0.0/16"
region                = "ap-northeast-2"
instance_type         = "t2.micro"
key_name              = "seoul-key"
azs                   = ["ap-northeast-2a", "ap-northeast-2b", "ap-northeast-2c"]
public_subnet_cidrs   = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
private_subnet_cidrs  = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
enable_nat_gateway    = true
single_nat_gateway    = true
enable_dns_hostnames  = true

