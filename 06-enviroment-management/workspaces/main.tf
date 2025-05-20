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

variable "db_pass" {
  description = "password for database"
  type        = string
  sensitive   = true
}

locals {
  environment_name = terraform.workspace
}

module "web_app" {
  source = "../../05-organization-and-structure/web-app-module"
  # Input Variables
  bucket_prefix    = "web-app-data-${local.environment_name}"
  domain           = "terraformlearning.com"
  environment_name = local.environment_name
  instance_type    = "t2.micro"
  create_dns_zone  = terraform.workspace == "production" ? true : false # This allows me to create DNS zones only if workspace is in production
  db_name          = "${local.environment_name}mydb"
  db_user          = "foo"
  db_pass          = var.db_pass
}
