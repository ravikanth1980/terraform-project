resource "aws_security_group" "dev_sg" {
  vpc_id = var.vpc_id
  name = var.dev_sg_name
  dynamic "ingress" {
    for_each = var.dev_sg_inbound_ports
    content {
      protocol = var.dev_sg_Protocol  
      from_port = ingress.value
      to_port = ingress.value
      cidr_blocks = [var.dev_sg_cidr_block]
    }
    }
    egress {
        protocol = "tcp"
        from_port = 0
        to_port = 0
        cidr_blocks = [var.dev_sg_cidr_block]
    }
    tags = {
        Name = "dev_sg_tag_name"
    }
}

