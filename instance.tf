resource "aws_instance" "web" {
  ami                    = "ami-0d26988ace6e4122b"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.web-kp.key_name
  subnet_id              = aws_subnet.main-public-1.id
  vpc_security_group_ids = [aws_security_group.web-sg.id]
  user_data = <<-EOF
            #!/bin/bash
            sudo apt-get update -y
            sudo apt-get upgrade -y
            sudo apt install apache2 -y
            EOF
  tags = merge(
    local.common_tags,
    {
      Name = "Webserver"
    }
  )
}

resource "aws_instance" "db" {
  ami                    = "ami-0d26988ace6e4122b"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.web-kp.key_name
  subnet_id              = aws_subnet.main-private-1.id
  vpc_security_group_ids = [aws_security_group.db-sg.id]
  user_data = <<-EOF
           #!/bin/bash
           sudo apt-get update -y
           sudo apt-get upgrade -y
           sudo apt install mysql-server -y
           EOF
  tags = merge(
    local.common_tags,
    {
      Name = "Database"
    }
  )
}