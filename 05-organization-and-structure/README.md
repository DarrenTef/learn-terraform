# Terraform Project: Modular Web App Infrastructure

This Terraform project is organized to support reusable, maintainable infrastructure through both third-party and custom modules.

## Structure

```
.
├── consul/                     # Uses third-party Consul module
├── web-app/                   # Root Terraform configuration
│   ├── main.tf                # Uses web-app-module
│   └── .terraform/            # Terraform state management
└── web-app-module/            # Custom module defining the full web app stack
    ├── compute.tf             # EC2 instances
    ├── database.tf            # RDS setup
    ├── dns.tf                 # Route53 records
    ├── network.tf             # VPC and subnet logic
    ├── storage.tf             # S3 bucket
    ├── variables.tf           # Input variables
    ├── outputs.tf             # Output values
    └── main.tf                # Orchestration entry point
```

## Third-Party Modules

The `consul/` directory uses a pre-built Consul module, allowing us to easily deploy a Consul cluster without writing all the low-level resources ourselves.

## Custom Modules

The `web-app-module/` directory defines a modular infrastructure setup for a basic web application. It includes everything from compute, database, DNS. networking, to S3 storage. All components are split across separate `.tf` files for clarity and maintainability.

## Why Modularize

- Keeps configurations clean and focused
- Enables reusability across environments or teams
- Makes testing and updating individual components easier
- Encourages a separation of concerns

This structure supports scaling up to more complex applications while keeping your Terraform code manageable.