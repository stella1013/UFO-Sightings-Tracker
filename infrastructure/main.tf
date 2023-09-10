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
variable "AWS_ACCESS_KEY_ID" {
    type = string

}
variable "AWS_ACCESS_KEY" {
     type = string
}
variable "UFOST_AWS_ACCESS_KEY_ID" {
    type = string

}
variable "UFOST_AWS_ACCESS_KEY" {
     type = string
}
variable "aws_region" {
     type = string
}
variable "instance_name" {
     type = string
}
variable "vpc_id" {
     type = string
}
variable "vpc_cidr_block" {
     type = string
}
variable "key_name" {
     type = string
}
provider "aws" {
  region = var.aws_region
}
resource "aws_iam_instance_profile" "test_profile" {
  name = "test_profile"
  role = aws_iam_role.role.name
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "role" {
  name               = "test_role"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_instance" "app-server-jenkins" {
  ami             = "ami-00a9282ce3b5ddfb1"
  instance_type   = "t2.micro"
  key_name = var.key_name
  iam_instance_profile = "${aws_iam_instance_profile.test_profile.name}"
  vpc_security_group_ids = [aws_security_group.jenkins_secgroup.id]
  
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
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

}
