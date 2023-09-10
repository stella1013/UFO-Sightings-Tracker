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


provider "aws" {
  region = var.aws_region
}

}
