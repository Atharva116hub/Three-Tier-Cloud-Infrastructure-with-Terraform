resource "aws_lb" "alb" {
  name               = "web-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = []
  subnets            = var.public_subnets
}

resource "aws_lb_target_group" "tg" {
  name     = "web-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

resource "aws_lb_target_group_attachment" "target" {
  count            = length(var.ec2_instance_ids)
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = var.ec2_instance_ids[count.index]
  port             = 80
}

output "dns_name" {
  value = aws_lb.alb.dns_name
}

variable "vpc_id" {}
variable "public_subnets" {}
variable "ec2_instance_ids" {}