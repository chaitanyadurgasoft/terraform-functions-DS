resource "aws_vpc" "NewBank-vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name = var.vpc_name
    env  = var.env
  }
}
resource "aws_internet_gateway" "NewBank-IGW" {
  vpc_id = aws_vpc.NewBank-vpc.id
  tags = {
    Name = "${var.vpc_name}-IGW"
  }
}