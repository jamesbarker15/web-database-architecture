locals {
  my_ip = data.http.public_ip.response_body
}


locals {
  common_tags = {
    Owner       = "Dev Team"
    Environment = "Development"
  }
}