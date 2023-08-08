# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association#argument-reference
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group#example-usage


resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "vpc-terraform"
  }
}

resource "aws_subnet" "subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "Subnet-terraform"
  }
}

resource "aws_internet_gateway" "internet_gtw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "Internet-gateway-terraform"
  }
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0" # o tráfego da intenet se comunica com o "gateway_id"
    gateway_id = aws_internet_gateway.internet_gtw.id
  }

  tags = {
    Name = "Route-table-terraform"
  }
}

resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.subnet.id
  route_table_id = aws_route_table.route_table.id
}

resource "aws_security_group" "security_group" {
  name   = "security-group-terraform"
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    # cidr_blocks      = [aws_vpc.main.cidr_block]
    cidr_blocks = ["0.0.0.0/0"] # não é recomendado fazer isso
    # ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}