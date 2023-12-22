resource "aws_instance" "app_server" {
  count = var.ec2_instance_count
  ami           = "ami-0c7217cdde317cfec"
  instance_type = "t2.micro"

  tags = {
    Name = "Server ${count.index}"
  }
}

