
variable "efs-name" {
description = "Name of the File system"
}

variable "vpc_id"{
    description = "VPC ID"
   #type = "string"
}

variable "subnet-ids"{
    description = "subnet-id"
    type = list(string)
}

