terraform {
  # Assumes s3 bucket and dynamo table is set up
  backend "s3" {
    bucket         = "terraformlearning-dev-terraform-state"
    key            = "env/dev/app.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraformlearning-dev-terraform-state-lock"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "consul" {
  source = "git@github.com:hashicorp/terraform-aws-consul.git"
}