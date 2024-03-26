# provider "aws" {
#   region = "us-west-2"
# }

resource "tls_private_key" "private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096

}

resource "local_file" "private_key_file" {
  content  = tls_private_key.private_key.private_key_pem
  filename = "$(path.module)/private_key.pem"
}

resource "aws_key_pair" "private_key_pair" {

  key_name   = "private_key"
  public_key = tls_private_key.private_key.public_key_openssh
}