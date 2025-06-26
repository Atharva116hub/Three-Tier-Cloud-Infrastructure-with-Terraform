resource "aws_instance" "web" {
  ami                    = "ami-03e38f46f79020a70"
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_groups
  key_name               = var.key_name

  tags = {
    Name = "web-instance"
  }
}

output "instance_id" {
  value = aws_instance.web.id
}

output "public_ip" {
  value = aws_instance.web.public_ip
}

variable "instance_type" {}
variable "subnet_id" {}
variable "vpc_security_groups" {}
variable "key_name" {}