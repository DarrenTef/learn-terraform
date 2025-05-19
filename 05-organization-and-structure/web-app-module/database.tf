
# Example of how to kick up a s3 bucket - notice the hard coded username and password, willbe removed later
resource "aws_db_instance" "db_instance" {
  allocated_storage = 20
  storage_type      = "standard"
  engine            = "postgres"
  engine_version    = "13"
  instance_class    = "db.t3.micro"
  name              = var.db_name
  # Because username and password are sensitive, we mostlikely want to pass them in at runtime
  # Using terraform apply -var="db_user=myuser" -var="db_pass=SECRETPASS"
  # Ideally we automate this so, we want to store this sensitive data in github secret or aws secret
  username            = var.db_user
  password            = var.db_pass
  skip_final_snapshot = true
  publicly_accessible  = false  
}
