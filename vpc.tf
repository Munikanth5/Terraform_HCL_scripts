#create a Vpc in AWS

resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
    
}

resource "aws_subnet" "my_subnet" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true"

    tags = {
        Name = "public_subnet"
    }
}

resource "aws_subnet" "my_subnet_1" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = "false"

    tags = {
        Name = "private_subnet"
    }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "IGW"
  }
}