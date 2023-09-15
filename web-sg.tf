resource "aws_security_group" "web-sg" {
  vpc_id      = aws_vpc.main.id
  name        = "web_server_sg"
  description = "HTTP for webserver"
   tags = merge(
    local.common_tags,
    {
      Name = "Web Security Group"
    }
  )

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${local.my_ip}/32"]
  }
}