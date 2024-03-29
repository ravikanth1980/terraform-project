
data "aws_vpc" "default_vpc_id" {}

module "dev_sg_allow" {
  source               = "./sg"
  dev_sg_name          = title("SSH security group name")
  dev_sg_inbound_ports = [22,80]
  vpc_id               = data.aws_vpc.default_vpc_id.id
  dev_sg_cidr_block    = "0.0.0.0/0"
  dev_sg_Protocol      = "tcp"
  dev_sg_tag_name      = "dev SG"
  dev_vpc_name         = "dev VPC"

}

