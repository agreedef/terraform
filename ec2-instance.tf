resource "aws_instance" "terraform-bastion" {
  ami = "ami-0bd7691bf6470fe9c"
  instance_type = "t2.micro"
  key_name = "hyunjin-kim-megazone"
  availability_zone = "ap-northeast-2a"
  subnet_id = aws_subnet.terraform-public-sub-2a.id
  associate_public_ip_address = true

  vpc_security_group_ids = [
    aws_security_group.terraform-bastion-sg.id
  ]

  tags = {
    Name = "terraform-bastion"
  }
}

resource "aws_instance" "terraform-web" {
  ami = "ami-0bd7691bf6470fe9c"
  instance_type = "t2.micro"
  key_name = "hyunjin-kim-megazone"
  availability_zone = "ap-northeast-2a"
  subnet_id = aws_subnet.terraform-private-sub-2a.id
  associate_public_ip_address = false
  
  vpc_security_group_ids = [
    aws_security_group.terraform-web-sg.id
  ]

  tags = {
    Name = "terraform-web"
  }
}
