output "web_server_public_address" {
  value = aws_eip.web-server.public_ip
}

output "database_server_private_address" {
  value = aws_instance.db.private_ip
}