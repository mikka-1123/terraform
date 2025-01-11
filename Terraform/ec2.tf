# resource "aws_key_pair" "deployer" {
#   key_name   = "terra-automate-key"
#   //public_key = file("/home/codespace/.ssh/id_rsa.pub")
#   //public_key = "mumbaiKeyPair"
# }

resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "allow_user_to_connect" {
    name        = "allow TLS"
    description = "Allow user to connect"
    vpc_id      = aws_default_vpc.default.id
    ingress {
        description = "port 22 allow"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        description = " allow all outgoing traffic "
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "port 80 allow"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "port 443 allow"
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "port 30000-32767 allow"
        from_port   = 30000
        to_port     = 32767
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
     
    ingress {
        description = "port 6379 allow"
        from_port   = 6379
        to_port     = 6379
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    ingress {
        description = "port 465 allow"
        from_port   = 465
        to_port     = 465
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "port 3000-10000 allow"
        from_port   = 3000
        to_port     = 10000
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "port 25 allow"
        from_port   = 25
        to_port     = 25
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "port 6443 allow"
        from_port   = 6443
        to_port     = 6443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "mysecurity"
    }
}

resource "aws_instance" "testinstance" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  #key_name        = aws_key_pair.deployer.key_name
  key_name = "mumbaiKeyPair"
  security_groups = [aws_security_group.allow_user_to_connect.name]
  tags = {
    Name = "Automate"
  }
  root_block_device {
    volume_size = 29 
    volume_type = "gp3"
  }
}