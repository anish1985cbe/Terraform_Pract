# VPC
resource "aws_vpc" "login-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "login-vpc"
  }
}


# Subnet For Frontend
resource "aws_subnet" "login-front-subnet" {
  vpc_id     = aws_vpc.login-vpc.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-west-2a"
  map_public_ip_on_launch = "true"


  tags = {
    Name = "login-frontend-subnet"
  }
}


# Subnet For Backend
resource "aws_subnet" "login-Backend-subnet" {
  vpc_id     = aws_vpc.login-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-west-2a"
  map_public_ip_on_launch = "true"


  tags = {
    Name = "login-Backend-subnet"
  }
}



# Subnet For Database
resource "aws_subnet" "login-Database-subnet" {
  vpc_id     = aws_vpc.login-vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-west-2c"
  map_public_ip_on_launch = "false"


  tags = {
    Name = "login-Database-subnet"
  }
}


# Internet Gateway For WWW Access
resource "aws_internet_gateway" "login-igw" {
  vpc_id = aws_vpc.login-vpc.id

  tags = {
    Name = "login-internet-gateway"
  }
}
