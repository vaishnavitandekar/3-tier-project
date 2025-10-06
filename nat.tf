#NatGW
resource "aws_nat_gateway" "flipkart-natgw-01" {
  allocation_id = aws_eip.flipkart-nat-eip.id
  subnet_id     = aws_subnet.flipkart-pub-sub-1.id

  tags = {
    Name = "flipkart-natgw-01"
  }
  depends_on = [aws_internet_gateway.flipkart-igw]
}


