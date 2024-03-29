module "vpc" {
  source = "./vpc"

  dev_vpc_cidr                = "10.0.0.0/16"
  vpc_name                    = "dev-vpc"
  dev_vpc_subnet_cidr         = "10.0.1.0/24"
  dev_public_subnet_az        = "us-west-2a"
  dev_vpc_private_subnet_cidr = "10.0.2.0/24"
  dev_private_subnet_az       = "us-west-2b"
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_id" {
  value = module.vpc.public_subnet_id
}

output "private_subnet_id" {
  value = module.vpc.private_subnet_id
}

output "internet_gateway_id" {
  value = module.vpc.internet_gateway_id
}
