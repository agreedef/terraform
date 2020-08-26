resource "aws_internet_gateway" "terraform-igw" {
  vpc_id = aws_vpc.terraform-vpc.id
  tags = {
    Name = "terraform-igw"
  }
}

resource "aws_eip" "terraform-eip" {
  vpc = true
}

resource "aws_nat_gateway" "terraform-nat" {
  allocation_id = aws_eip.terraform-eip.id
  subnet_id = aws_subnet.terraform-public-sub-2a.id

  tags = {
    Name = "terraform-nat"
  }
}
