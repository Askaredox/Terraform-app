variable "my_access_key" {
  description = "Access-key-for-AWS"
  default     = "no_access_key_value_found"
}

variable "my_secret_key" {
  description = "Secret-key-for-AWS"
  default     = "no_secret_key_value_found"
}

provider "aws" {
  region     = "us-east-2"
  access_key = var.my_access_key
  secret_key = var.my_secret_key
}

resource "aws_instance" "SA-Presentacion" {
  ami                    = "ami-0fb653ca2d3203ac1"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]

  tags = {
    Name = "Presentacion-SoftwareAvanzado"
  }


  user_data = file("./script.sh")

}

resource "aws_security_group" "instance" {
  name = "SA-Presentacion-security-group"

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
