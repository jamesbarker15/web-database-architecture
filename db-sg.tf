resource "aws_security_group" "db-sg" {
  vpc_id      = aws_vpc.main.id
  name        = "db_server_sg"
  description = "mysql from webserver"
  tags = merge(
    local.common_tags,
    {
      Name = "DB Security Group"
    }
  )

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["${aws_instance.web.private_ip}/32"]
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["${aws_instance.web.private_ip}/32"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${aws_instance.web.private_ip}/32"]
  }

}