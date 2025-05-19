# Terraform Project Structure: Variables, Inputs, and Outputs

This project is structured to support reusable, environment-driven infrastructure using Terraform’s configuration system.

## Key Concepts Used

### variables.tf
All configurable values like region, instance type, database credentials, and bucket names are defined in one place. This makes the code flexible and easy to reuse across different environments such as dev, staging, and production.

### terraform.tfvars
This file contains the actual values passed into the variables. It separates environment-specific data from the core infrastructure code, allowing for simple switching between setups.

### Inputs
The Terraform configuration files reference variables using the `var.` syntax. This enables the infrastructure to be driven by whatever values are provided at runtime, keeping the code generic and adaptable.

### outputs.tf
Outputs expose useful information after provisioning — such as EC2 public IPs or the database address — so they can be referenced or used later without manually searching in the AWS console.

### locals
Local values are used to store computed values or naming patterns that help keep the configuration clean and reduce repetition.

## Benefits

- Infrastructure is environment-agnostic
- Sensitive data is kept out of the main codebase
- Output values provide quick access to critical connection details
- Clear separation between configuration and implementation