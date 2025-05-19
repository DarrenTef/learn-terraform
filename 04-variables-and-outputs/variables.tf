variable "region" {
  description = "Default region for provider"
  type = string
  default = "us-east-1"
}

variable "app_name" {
    description = "Name of the web app"
    type = string
    default = "web-app"
}

variable "environment_name" {
  description = "Deployment enviroment (dev/staging/production)"
  type = string
  default = "dev"
}

# EC2 Variables
variable "ami" {
    description = "Amazon machine image to use for ec2 instance"
    type = string
    default = "ami-011899242bb902164"
}

variable "instance_type" {
    description = "ec2 instance type"
    type = string
    default = "t2.micro"
}

# S3 Variables

variable "bucket_name" {
    description = "name of s3 bucket for app data"
    type = string
}

# Route53 Variables
variable "domain" {
    description = "Domain for website"
    type = string
}

# RDS Variables
variable "db_name" {
  description = "Name of DB"
  type = string
}

variable "db_user" {
    description = "Ssername for db"
    type = string
}

variable "db_pass" {
    description = "password for db"
    type = string
    sensitive = true
}