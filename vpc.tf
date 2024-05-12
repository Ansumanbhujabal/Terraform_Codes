#VPC
resource "aws_vpc" "test" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "test"
  }

# PUBLIC SUBNET 
resource "aws_subnet" "test-web" {
  vpc_id     = aws_vpc.test.id
  cidr_block = "10.0.1.0/24"
  availability_zone ="ap-northeast-1"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "test-web-subnet"
  }
}
# PRIVATE SUBNET 
resource "aws_subnet" "test-database" {
  vpc_id     = aws_vpc.test.id
  cidr_block = "10.0.2.0/24"
  availability_zone ="ap-northeast-1"
  map_public_ip_on_launch = "false"

  tags = {
    Name = "test-database-subnet"
  }
}
# INTERNET GATEWAY
resource "aws_internet_gateway" "web-igw" {
  vpc_id = aws_vpc.test.id

# PUBLIC ROUTE TABLE
resource "aws_route_table" "web-rt" {
  vpc_id = aws_vpc.test.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.web-igw.id
  }


  tags = {
    Name = "web-routing-table"
  }
}
  tags = {
    Name = "main"
  }
}
