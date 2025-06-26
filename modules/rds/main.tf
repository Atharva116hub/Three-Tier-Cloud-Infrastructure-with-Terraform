resource "aws_db_subnet_group" "db_subnets" {
  name       = "db-subnet-group"
  subnet_ids = var.private_subnets

  tags = {
    Name = "DB Subnet Group"
  }
}

resource "aws_db_instance" "mysql" {
  identifier              = "three-tier-db"
  allocated_storage       = 20
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = "db.t3.micro"
 # name                    = "appdb"
  username                = "admin"
  password                = "StrongPassword123!"
  db_subnet_group_name    = aws_db_subnet_group.db_subnets.name
  vpc_security_group_ids  = var.vpc_security_groups
  skip_final_snapshot     = true
  publicly_accessible     = false
}

output "db_endpoint" {
  value = aws_db_instance.mysql.endpoint
}

variable "private_subnets" {}
variable "vpc_security_groups" {}