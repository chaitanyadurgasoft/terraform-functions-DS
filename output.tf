output "vpcid" {
  value = aws_vpc.NewBank-vpc.id
}
output "igwid" {
  value = aws_internet_gateway.NewBank-IGW.id
}
output "PublicSubnets_id" {
  value = aws_subnet.NewBank-Public-Subnet.*.id
}

output "PublicSubnetid_1" {
  value = aws_subnet.NewBank-Public-Subnet.0.id
}
output "PublicSubnetid_2" {
  value = aws_subnet.NewBank-Public-Subnet.1.id
}
output "PublicSubnetid_3" {
  value = aws_subnet.NewBank-Public-Subnet.2.id
}

output "privatesubnetids" {
  value = aws_subnet.NewBank-Private-Subnet.*.id
}