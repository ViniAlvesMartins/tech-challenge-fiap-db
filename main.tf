terraform {
  required_version = ">=1.1.4"

  backend "s3" {
    bucket = "state-version-tech"
    key = "terraform-state"
    region = "us-east-1"
  }

  required_providers {
    aws = {
      version = ">= 5.6"
      source  = "hashicorp/aws"
    }
  }

}

