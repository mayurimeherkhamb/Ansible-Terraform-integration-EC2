resource "aws_instance" "myec2" {
  ami                    = "ami-07caf09b362be10b8"
  instance_type          = "t2.micro"
  availability_zone = "us-east-1b"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  key_name = "ansible-terraform-keypair"

  tags = {
    name = "testec2"
  }

  provisioner "local-exec" {
    command = "echo ${aws_instance.myec2.public_ip} | sudo tee -a /etc/ansible/hosts"
  }
}
