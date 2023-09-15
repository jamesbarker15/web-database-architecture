resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.main-public-1.id
  tags = merge(
    local.common_tags,
    {
      Name = "DB NAT Gateway"
    }
  )
}