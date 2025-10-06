# Create a Route Table
resource "aws_route_table" "flipkart-web-rt" {
  vpc_id = aws_vpc.flipkart-vpc.id
  tags = {
    Name = "flipkart-web-rt"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.flipkart-igw.id
  }
}

resource "aws_route_table" "flipkart-app-rt" {
  vpc_id = aws_vpc.flipkart-vpc.id
  tags = {
    Name = "flipkart-app-rt"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.flipkart-natgw-01.id
  }
}

# Route Table Association
resource "aws_route_table_association" "flipkart-rt-as-1" {
  subnet_id      = aws_subnet.flipkart-pub-sub-1.id
  route_table_id = aws_route_table.flipkart-web-rt.id
}

resource "aws_route_table_association" "flipkart-rt-as-2" {
  subnet_id      = aws_subnet.flipkart-pub-sub-2.id
  route_table_id = aws_route_table.flipkart-web-rt.id
}

resource "aws_route_table_association" "flipkart-rt-as-3" {
  subnet_id      = aws_subnet.flipkart-pvt-sub-1.id
  route_table_id = aws_route_table.flipkart-app-rt.id
}
resource "aws_route_table_association" "flipkart-rt-as-4" {
  subnet_id      = aws_subnet.flipkart-pvt-sub-2.id
  route_table_id = aws_route_table.flipkart-app-rt.id
}

resource "aws_route_table_association" "flipkart-rt-as-5" {
  subnet_id      = aws_subnet.flipkart-pvt-sub-3.id
  route_table_id = aws_route_table.flipkart-app-rt.id
}
resource "aws_route_table_association" "flipkart-rt-as-6" {
  subnet_id      = aws_subnet.flipkart-pvt-sub-4.id
  route_table_id = aws_route_table.flipkart-app-rt.id
}

# Create an Elastic IP address for the NAT Gateway
resource "aws_eip" "flipkart-nat-eip" {
  domain = "vpc"
  tags = {
    Name = "flipkart-nat-eip"
  }
}

