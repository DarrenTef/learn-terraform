# Terraform: Load Balanced EC2 + S3 + Backend State

This project sets up a basic AWS infrastructure using Terraform.

## What's Included

- Remote S3 + DynamoDB backend for state management
- Two EC2 instances with HTTP servers
- Load balancer routing traffic to both EC2s
- Encrypted, versioned S3 bucket
- Security groups for EC2 and ALB
- Health checks and listener rules for traffic management

## Commands Used

```bash
terraform init     
terraform plan     
terraform apply    
terraform destroy  
```

Everything is deployed in `us-east-1`. Make sure you’ve authenticated with AWS beforehand.
