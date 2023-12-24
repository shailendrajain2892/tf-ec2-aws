resource "aws_instance" "app_server" {
  count = var.ec2_instance_count
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  # security group to allow ssh access to ec2 instances
  vpc_security_group_ids = [aws_security_group.ssh_access.id]

  tags = {
    Name = "Server ${count.index}"
  }

  # provisioner "local-exec" { # Run a command after the infrastructure has been provisioned on the local machine not on EC2 instnace
  #   command = "echo The server's IP address is ${self.private_ip}"
  # }

  # provisioner "remote-exec" {
  #   inline = [ 
  #      "sudo amazon-linux-extras install -y nginx1.12",
  #      "sudo systemctl start nginx"      
  #    ]
    
  #   connection {
  #     type = "ssh"
  #     user = "ec2-user"
  #     private_key = file("~/terraform.pem")
  #     host = self.public_ip
  #   }
  # }
}


resource "aws_security_group" "ssh_access" {
  name = "allow_ssh"
  description = "Allow SSH Access"

  ingress {
    description = "SSH into VPC"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Outbound Allowed"
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
}
