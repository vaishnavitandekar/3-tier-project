# VPC
resource "aws_vpc" "flipkart-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "flipkart-vpc"
  }
}

