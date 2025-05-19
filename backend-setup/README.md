# Terraform Backend Bootstrap

#### Provision an S3 bucket (with versioning & encryption) and DynamoDB table for Terraform remote state and locking.

## Setup
```
make bootstrap-backend
```

This will
* Create the S3 Bucket and DynamoDB table
* Clean up local .terraform files after setup

### Prerequisites
* Terraform 1.6+
* AWS CLI with credentials configured

### Credits
[Article from Medium](https://medium.com/@owumifestus/automating-terraform-backend-setup-bootstrapping-s3-and-dynamodb-state-aa2d2070e258)