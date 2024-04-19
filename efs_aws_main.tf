# ## Define EFS Module
# module "EFS-module" {
#   source   = "./EFS-module"
#   efs-name = "ec2-efs"
#   #subnet-ids = ["subnet-0252e837767bdda68", "subnet-043049d2b649be630"]
#   subnet-ids = module.vpc.public_subnet_id
#   #vpc_id     = data.aws_vpc.default_vpc_id.id
#   vpc_id = module.vpc.vpc_id
# }

# module "vpc" {
#   source                      = "./vpc"
#   dev_vpc_cidr                = "10.0.0.0/16"
#   vpc_name                    = "dev-vpc"
#   dev_vpc_subnet_cidr         = "10.0.1.0/24"
#   dev_public_subnet_az        = "us-west-2a"
#   dev_vpc_private_subnet_cidr = "10.0.2.0/24"
#   dev_private_subnet_az       = "us-west-2b"
# }

# resource "aws_instance" "web_server" {
#   ami           = "ami-089313d40efd067a9"
#   instance_type = "t2.micro"
#   # subnet_id       = module.EFS-module.subnet_ids[0]
#   subnet_id       = module.vpc.public_subnet_id
#   key_name        = aws_key_pair.private_key_pair.key_name
#   security_groups = [module.EFS-module.security_id]
#   tags = {
#     Name = "web_server"
#   }
# }

# # resource "aws_efs_mount_target" "efs-mount" {
# #   count          = length(module.EFS-module.subnet_ids)
# #   file_system_id = module.EFS-module.efs_id
# #   subnet_id      = module.EFS-module.subnet_ids[count.index]
# # }

# output "efs_id" {
#   value = module.EFS-module.efs_id
# }
# output "security_id" {
#   value = module.EFS-module.security_id
# }

# output "vpc_id" {
#   value = module.vpc.vpc_id
# }

# output "public_subnet_id" {
#   value = module.vpc.public_subnet_id
# }

# output "private_subnet_id" {
#   value = module.vpc.private_subnet_id
# }

# output "internet_gateway_id" {
#   value = module.vpc.internet_gateway_id
# }