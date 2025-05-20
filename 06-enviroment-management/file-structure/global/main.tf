terraform {
  # Assumes s3 bucket and dynamo table is set up
  backend "s3" {
    bucket         = "terraformlearning-dev-terraform-state"
    key            = "06-managing-multiple-enviroments/global/terraform.tfstate"
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

# Route53 zone is shared across staging and production
resource "aws_route53_zone" "primary" {
  name = "devopsdeployed.com"
}
