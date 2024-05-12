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
# PUBLIC ROUTE TABLE ASSOCIATION
resource "aws_route_table_association" "web-rt-association" {
  subnet_id      = aws_subnet.test.id
  route_table_id = aws_route_table.web-rt.id
}

# PRIVATE ROUTE TABLE
resource "aws_route_table" "db-rt" {
  vpc_id = aws_vpc.test.id

# PRIVATE ROUTE TABLE ASSOCIATION
resource "aws_route_table_association" "db-rt-association" {
  subnet_id      = aws_subnet.test.id
  route_table_id = aws_route_table.db-rt.id
}

  tags = {
    Name = "db-routing-table"
  }
}

# PUBLIC NACL
resource "aws_network_acl" "test-web-nacl" {
  vpc_id = aws_vpc.test.id

  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 65535
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 65535
  }

  tags = {
    Name = "test-web-nacl"
  }
}


# PUBLIC NACL ASSOCIATION
resource "aws_network_acl_association" "web-nacl-association" {
  network_acl_id = aws_network_acl.test-web-nacl.id
  subnet_id      = aws_subnet.test-web.id
}



# PRIVATE NACL
resource "aws_network_acl" "test-db-nacl" {
  vpc_id = aws_vpc.test.id

  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 65535
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 65535
  }

  tags = {
    Name = "test-db-nacl"
  }
}
# PRIVATE NACL ASSOCIATION
resource "aws_network_acl_association" "db-nacl-association" {
  network_acl_id = aws_network_acl.test-db-nacl.id
  subnet_id      = aws_subnet.test-database.id
}

# PUBLIC SECUIRTY GROUP

resource "aws_security_group" "test-web-sg" {
  name        = "test-web-sg"
  description = "Allows web traffic"
  vpc_id      = aws_vpc.test.id

  tags = {
    Name = "test-web-sg"
  }
}
