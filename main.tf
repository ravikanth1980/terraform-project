# terraform {
#   backend "s3" {
#     bucket = "sercret-bucket"
#     key = "sercret-bucket/terraform.tfstate"
#     region = "us-west-2" 
#     dynamodb_table = "statelock"
#     encrypt = true  
#   }

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.42.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

