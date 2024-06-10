terraform {
  backend "s3" {
    bucket = "terraformstate-circleci"
    key    = "circleci-runner-aws.tfstate"
    region = "us-east-1"
    role_arn = "arn:aws:iam::730335471586:role/admin"
  }

}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.47.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.5.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.1"
    }
  }
}

provider "aws" {
  assume_role {
    role_arn     = "arn:aws:iam::730335471586:role/admin"
    session_name = "circleci-runner-test"
  }
  region     = var.aws_region

  default_tags {
    tags = var.default_tags
  }
}
