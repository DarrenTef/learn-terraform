terraform {
  # Assumes s3 bucket and dynamo table is set up
  backend "s3" {
    bucket         = "terraformlearning-dev-terraform-state"
    key            = "07-testing/examples/hello-world/terraform.tfstate"
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


module "web_app" {
  source = "../../modules/hello-world"
}

output "instance_ip_addr" {
  value = module.web_app.instance_ip_addr
}

output "url" {
  value = "http://${module.web_app.instance_ip_addr}:8080"
}
