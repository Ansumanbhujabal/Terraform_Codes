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

