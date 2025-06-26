output "vpc_id" {
    value = module.vpc.vpc_id
}

output "ec2_instance_id" {
    value = module.ec2.web_instance_id

}

output "rds_endpoint" {
    value = module.rds.db_endpoint
  
}

output "alb_dns_name" {
    value = module.alb.alb_dns_name
  
}

