terraform {
  cloud {
    organization = "stellar-galaxies-org"

    workspaces {
      name = "ufo-site-workspace"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.16.1"
    }
  }

}

provider "aws" {
  region = "us-east-2"
}
resource "aws_iam_instance_profile" "test_profile" {
  name = "test_profile"
  role = aws_iam_role.role.name
}


resource "aws_iam_role" "role" {
  name               = "test_role"
  assume_role_policy = <<EOF
    {
    "Version": "2012-10-17",
    "Statement": [
        {
        "Action": "sts:AssumeRole",
        "Principal": {
            "Service": "ec2.amazonaws.com"
        },
        "Effect": "Allow",
        "Sid": ""
        }
    ]
    }
    EOF
}

resource "aws_instance" "app-server-jenkins" {
  ami                    = "ami-00a9282ce3b5ddfb1"
  instance_type          = "t2.micro"
  key_name               = "sandboxkeyreg2"
  iam_instance_profile   = aws_iam_instance_profile.test_profile.name
  vpc_security_group_ids = [aws_security_group.jenkins_secgroup.id]
  user_data              = file("install_jenkins.sh")

  tags = {
    Name = var.instance_name
  }
}

resource "aws_security_group" "jenkins_secgroup" {
  name        = "jenkins_secgroup"
  description = "Allow Jenkins web traffic for inbound ssh and http and all outbound"
  vpc_id      = var.vpc_id


  ingress {
    description = "Allow from Personal CIDR block"
    from_port   = 8081
    to_port     = 8081
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow SSH from Personal CIDR block"
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
