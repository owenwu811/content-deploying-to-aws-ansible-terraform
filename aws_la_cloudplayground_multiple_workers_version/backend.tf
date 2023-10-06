#Set S3 backend for persisting TF state file remotely, ensure bucket already exits
# And that AWS user being used by TF has read/write perms
#s3 backend stores terraform state in an s3 bucket to avoid teams stepping on each other's toes and uses Dynamodb for consistency checking and state locking
#when you run terraform init, terraform will prompt you to transfer existing state files to the new s3 bucket. 
terraform {
  required_version = ">=0.12.0"
  required_providers {
    aws = ">=3.0.0"
  }
  backend "s3" {
    region  = "us-east-1"
    profile = "default"
    key     = "terraformstatefile"
    bucket  = "<name-of-already-created-bucket>"
  }
}

