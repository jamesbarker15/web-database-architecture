resource "aws_key_pair" "web-kp" {
  key_name   = "web-kp"
  public_key = file("mykey.pub")
  lifecycle {
    ignore_changes = [public_key]
  }
  tags = merge(
    local.common_tags,
    {
      Name = "Webserver KeyPair"
    }
  )
}