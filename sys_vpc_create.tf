provider "aws" {
  region = "us-west-2" # Change this to your desired AWS region
}

resource "aws_vpc" "my_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "my-vpc"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-west-2" # Change this to your desired availability zone

  map_public_ip_on_launch = true

  tags = {
    Name = "my-subnet"
  }
}
