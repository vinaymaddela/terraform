output "public-ip-address" {
  value = aws_instance.hyd_web_srv.public_ip
}