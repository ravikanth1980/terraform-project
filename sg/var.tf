variable "vpc_id" {
description = "VPC ID"
type = string
#default = "value"
 }

variable "dev_sg_inbound_ports" {
description = "Security group port numbers"
type = list(number)
#default = "value"
 }

variable "dev_sg_cidr_block" {
description = "CIDR Blocks"
type = string
#default = "value"
 }

variable "dev_sg_Protocol" {
description = "Security protocol"
type = string
#default = "value"
 }

variable "dev_sg_tag_name" {
description = "Security Tag"
type = string
#default = "value"
 }

variable "dev_sg_name" {
description = "Sg group name"
type = string
#default = "value"
 }

variable "dev_vpc_name" {
description = "Vpc group name"
type = string
#default = "value"
 }