provider "aws" {
  alias      = "vpc"
  region     = "us-west-2"
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_vpc" "my_vpc" {
  provider             = aws.vpc # Use the provider alias here
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "my-vpc"
  }
}

resource "aws_subnet" "my_subnet" {
  provider          = aws.vpc # Use the provider alias here
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-west-2" # Change this to your desired availability zone

  map_public_ip_on_launch = true

  tags = {
    Name = "my-subnet"
  }
}
