resource "aws_eip" "web-server" {
  instance = aws_instance.web.id
  domain   = "vpc"
  tags = merge(
    local.common_tags,
    {
      Name = "Webserver EIP"
    }
  )
}

resource "aws_eip" "nat" {
  domain = "vpc"
  tags = merge(
    local.common_tags,
    {
      Name = "NAT EIP"
    }
  )
}