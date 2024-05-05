resource "aws_route_table" "NewBank-Public-Route" {
  vpc_id = aws_vpc.NewBank-vpc.id
  tags = {
    Name = "${var.vpc_name}-PublicRouteTable"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.NewBank-IGW.id
  }
}

resource "aws_route_table_association" "Public_route_table_assocation-1" {
  count          = length(var.Public_Subnet_Cidr)
  route_table_id = aws_route_table.NewBank-Public-Route.id
  subnet_id      = element(aws_subnet.NewBank-Public-Subnet.*.id, count.index)
}

resource "aws_route_table" "NewBank-Private-Route" {
  vpc_id = aws_vpc.NewBank-vpc.id
  tags = {
    Name = "${var.vpc_name}-PrivateRouteTable"
  }
  # route {
  #   cidr_block = "0.0.0.0/0"
  #   gateway_id = aws_internet_gateway.NewBank-IGW.id
  # }
}
resource "aws_route_table_association" "Private_route_table_assocation-1" {
  count          = length(var.Private_Subnet_Cidr)
  route_table_id = aws_route_table.NewBank-Private-Route.id
  subnet_id      = element(aws_subnet.NewBank-Private-Subnet.*.id, count.index)
}
