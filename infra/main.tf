terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}
provider "aws" {
  profile = "MyAWS"
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami  = var.amis.us-east-1
  instance_type = var.t2
  key_name = var.key_name
  tags = {
    Name = "Terraform Ansible Phyton"
  }
  vpc_security_group_ids = ["${aws_security_group.iac-ssh.id}", "${aws_security_group.http.id}","${aws_security_group.internet.id}" ]
}
resource "aws_key_pair" "chaveSSH" {
  key_name = var.key_name
  public_key = file("${var.key_name}.pub")
}

output IP_PUBLIC {
  value       = aws_instance.app_server.public_ip
  description = "IP PUBLICO"

}
