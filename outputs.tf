output "apache_public_ip" {
  value = element(concat(aws_instance.apache_server.*.public_ip, list("")), 0)
}
