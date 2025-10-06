# Internet Gateway
resource "aws_internet_gateway" "flipkart-igw" {
  tags = {
    Name = "flipkart-igw"
  }
  vpc_id = aws_vpc.flipkart-vpc.id
}

