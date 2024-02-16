output "public-ip-addresses" {
  value = aws_instance.hyd_web_srv.public_ip
}

output "private-ip-addresses" {
  value = aws_instance.hyd_web_srv.private_ip
}