# terraform {
# required_version = ">= 0.12"

# backend "s3" {

#   bucket         = "my-terraform-state-bucket"
#   key            = "path/to/my/terraform.tfstate"
#   region         = "us-west-2"
#   encrypt        = true
#   dynamodb_table = "my-terraform-lock-table"
#  }
# }