##  Defined default vpc
# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "5.42.0"
#     }
#   }
# }
# provider "aws" {
#   region = "us-west-2"
# }

data "aws_vpc" "default_vpc_id" {}

## Define EFS Module
module "EFS-module" {
  source     = "./EFS-module"
  efs-name   = "ec2-efs"
  subnet-ids = ["subnet-0252e837767bdda68", "subnet-043049d2b649be630"]
  vpc_id     = data.aws_vpc.default_vpc_id.id

}

##  Defined default vpc

# data "aws_vpc" "default_vpc_id" {}

## create a ec2-instance resource

resource "aws_instance" "web_server" {
  ami             = "ami-089313d40efd067a9"
  instance_type   = "t2.micro"
  subnet_id       = module.EFS-module.subnet_ids[0]
  key_name        = aws_key_pair.private_key_pair.key_name
  security_groups = [module.EFS-module.security_id]
  tags = {
    Name = "web_server"
  }
}
## Define EFS Module
# module "efs-module" {
#   source     = "./EFS-module"
#   efs-name   = "ec2-efs"
#   subnet-ids = ["subnet-0d29069b43874220a", "subnet-0252e837767bdda68", "subnet-043049d2b649be630"]
#   vpc_id     = data.vpc_id.default_vpc_id.id

# }
output "efs_id" {
  value = module.EFS-module.efs_id
}
output "security_id" {
  value = module.EFS-module.security_id
}
#}