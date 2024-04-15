
## create a EFS resource
resource "aws_efs_file_system" "efs"{

    creation_token = var.efs-name
    performance_mode = "generalPurpose"
       tags = {
      Name = var.efs-name
    }
}
## Create a EFS  mount target
resource "aws_efs_mount_target" "efs-target" {
    #count = length(var.subnet-ids)
    file_system_id = aws_efs_file_system.efs.id
    subnet_id = var.subnet-ids
}

## Create a EFS Security group 

resource "aws_security_group" "efs-sg" {
    description = "security group of efs .."
    name = var.efs-name
    vpc_id = var.vpc_id

   ingress {
      from_port = 2049
      to_port = 2049
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]

   }
   egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
   }
   tags = {
    Name = var.efs-name
  }
    
  }