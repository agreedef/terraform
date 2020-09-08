resource "aws_lb_target_group" "this" {
  name = "terraform-alb-tg"
  port = 80
  protocol = "HTTP"
  vpc_id = aws_vpc.terraform-vpc.id
}

resource "aws_lb_target_group_attachment" "this" {
  target_group_arn = aws_lb_target_group.this.arn
  target_id = aws_instance.terraform-web.id
  port = 80
}
