
resource "aws_security_group" "iac-ssh" {
  name        = "iac-ssh"
  description = "iac-ssh"

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = var.cdirs_acesso_remoto
  }

   tags = {
    Name = "ssh"
  }
}

resource "aws_security_group" "http" {
  name        = "http"
  description = "http"

  ingress {
    from_port        = 8000
    to_port          = 8000
    protocol         = "tcp"
    cidr_blocks      = var.cdirs_acesso_remoto
  }

   tags = {
    Name = "web"
  }
}

resource "aws_security_group" "internet" {
  name        = "internet"
  description = "internet"
  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}