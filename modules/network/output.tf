output "vpc_id" {
  value = aws_vpc.prodvpc.id
}

output "public_Subnet_ids" {
  value = aws_subnet.public_subnet[*].id

}

output "private_subnet_ids" {
  value = aws_subnet.private_subnet[*].id

}
