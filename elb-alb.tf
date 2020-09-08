resource "aws_lb" "this" {
  name = "terraform-alb"
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.terraform-alb-sg.id]
  subnets = [aws_subnet.terraform-public-sub-2a.id, aws_subnet.terraform-public-sub-2c.id]

  enable_deletion_protection = true

  tags = {
    Environment = "production"
  }
}

resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_lb.this.arn
  port = "80"
  protocol = "HTTP"
  
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}
