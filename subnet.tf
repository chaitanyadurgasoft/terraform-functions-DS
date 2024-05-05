resource "aws_subnet" "NewBank-Public-Subnet" {
  vpc_id            = aws_vpc.NewBank-vpc.id
  count             = length(var.Public_Subnet_Cidr)
  cidr_block        = element(var.Public_Subnet_Cidr, count.index)
  availability_zone = element(var.az, count.index)
  tags = {
    Name = "${var.vpc_name}-PublicSubnet-${count.index + 1}"
  }
  map_public_ip_on_launch = true

}
resource "aws_subnet" "NewBank-Private-Subnet" {
  vpc_id            = aws_vpc.NewBank-vpc.id
  count             = length(var.Private_Subnet_Cidr)
  cidr_block        = element(var.Private_Subnet_Cidr, count.index)
  availability_zone = element(var.az, count.index)
  tags = {
    Name = "${var.vpc_name}-PrivateSubnet-${count.index + 1}"
  }
  map_public_ip_on_launch = true

}
