# public routing
resource "aws_route_table" "terraform-public-1" {
  vpc_id = aws_vpc.terraform-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terraform-igw.id
  }
  tags = {
    Name = "terraform-public-1"
  }
}

resource "aws_route_table" "terraform-public-2" {
  vpc_id = aws_vpc.terraform-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terraform-igw.id
  }
  tags = {
    Name = "terraform-public-2"
  }
}

# private routing
resource "aws_route_table" "terraform-private-1" {
  vpc_id = aws_vpc.terraform-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.terraform-nat.id
  }
  tags = {
    Name = "terraform-private-1"
  }
}

resource "aws_route_table" "terraform-private-2" {
  vpc_id = aws_vpc.terraform-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.terraform-nat.id
  }
  tags = {
    Name = "terraform-private-2"
  }
}

resource "aws_route_table_association" "terraform-routing-public-1" {
  subnet_id = aws_subnet.terraform-public-sub-2a.id
  route_table_id = aws_route_table.terraform-public-1.id
}

resource "aws_route_table_association" "terraform-routing-public-2" {
  subnet_id = aws_subnet.terraform-public-sub-2c.id
  route_table_id = aws_route_table.terraform-public-2.id
}

resource "aws_route_table_association" "terraform-routing-private-1" {
  subnet_id = aws_subnet.terraform-private-sub-2a.id
  route_table_id = aws_route_table.terraform-private-1.id
}

resource "aws_route_table_association" "terraform-routing-private-2" {
  subnet_id = aws_subnet.terraform-private-sub-2c.id
  route_table_id = aws_route_table.terraform-private-2.id
}


