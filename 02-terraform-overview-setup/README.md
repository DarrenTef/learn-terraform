# Terraform AWS Setup

This directory contains my first Terraform project using AWS.

## What I Did

- Installed Terraform and authenticated to AWS using environment variables.
- Wrote a simple config (`main.tf`) to create an EC2 instance:

```hcl
resource "aws_instance" "example" {
  ami           = "ami-011899242bb902164"
  instance_type = "t2.micro"
}
```

- Ran the core Terraform commands:
  - `terraform init` — initialized the project
  - `terraform plan` — previewed the changes
  - `terraform apply` — created the EC2 instance
  - `terraform destroy` — cleaned everything up