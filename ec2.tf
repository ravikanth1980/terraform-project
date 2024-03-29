# resource "aws_instance" "name" {

#   ami           = var.ec2_ami
#   instance_type = var.ec2_inst_type
#   subnet_id     = aws_subnet.dev_public_subnet.id
#   key_name      = aws_key_pair.private_key_pair.key_name
#   tags = {
#     Name = "My_ec2-instance"
#   }

# }