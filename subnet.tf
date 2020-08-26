# Public Subnet
resource "aws_subnet" "terraform-public-sub-2a" {
  vpc_id = aws_vpc.terraform-vpc.id
  cidr_block = "10.10.1.0/24"
  availability_zone = "ap-northeast-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "terraform-public-sub-2a"
  }
}

resource "aws_subnet" "terraform-public-sub-2c" {
  vpc_id = aws_vpc.terraform-vpc.id
  cidr_block = "10.10.2.0/24"
  availability_zone = "ap-northeast-2c"
  map_public_ip_on_launch = true
  tags = {
    Name = "terraform-public-sub-2c"
  }
}

# Private Subnet
resource "aws_subnet" "terraform-private-sub-2a" {
  vpc_id = aws_vpc.terraform-vpc.id
  cidr_block = "10.10.3.0/24"
  availability_zone = "ap-northeast-2a"
  map_public_ip_on_launch = false
  tags = {
    Name = "terraform-private-sub-2a"
  }
}

resource "aws_subnet" "terraform-private-sub-2c" {
  vpc_id = aws_vpc.terraform-vpc.id
  cidr_block = "10.10.4.0/24"
  availability_zone = "ap-northeast-2c"
  map_public_ip_on_launch = false
  tags = {
    Name = "terraform-private-sub-2c"
  }
}

