terraform {
  backend "local" {
    path = "/tmp/terraform/workspace/terraform.tfstate"
  }
}
resource "aws_instance" "backend" {
  ami                    = var.amis[var.region]
  instance_type          = "${var.instance_type}"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${var.sg-id}"]
}
