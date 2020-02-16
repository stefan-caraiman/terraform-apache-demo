resource "aws_key_pair" "my_ssh_key" {
  key_name   = "terraform-demo"
  public_key = file("/home/scaraiman/.ssh/id_rsa.pub")
}

resource "aws_instance" "apache_server" {
  count                       = var.server_count
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.server_instance_type
  user_data                   = file("${path.module}/files/apache.sh")
  key_name                    = aws_key_pair.my_ssh_key.key_name
  associate_public_ip_address = true
  tags = {
    Name      = "ApacheServer"
    CreatedBy = "Terraform"
  }
}

