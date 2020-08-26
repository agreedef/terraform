resource "aws_security_group" "terraform-bastion-sg" {
  vpc_id = aws_vpc.terraform-vpc.id
  name = "terraform-bastion-sg"
  description = "Allow SSH port from all"

  tags = {
    Name = "terraform-bastion-sg"
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["221.148.35.240/32"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "terraform-web-sg" {
  vpc_id = aws_vpc.terraform-vpc.id
  name = "terraform-web-sg"
  description = "web-sg"

  tags = {
    Name = "terraform-web-sg"
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [aws_vpc.terraform-vpc.cidr_block]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
