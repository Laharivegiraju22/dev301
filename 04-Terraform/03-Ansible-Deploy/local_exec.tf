terraform {
  backend "local" {
    path = "/tmp/terraform/workspace/terraform.tfstate"
  }

}
resource "null_resource" "remote-exec-1" {
    connection {
    user        = "ubuntu"
    type        = "ssh"
    private_key = "${file(var.pvt_key)}"
    host        = "${aws_instance.backend.public_ip}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install python sshpass -y",
    ]
  }
}
resource "null_resource" "ansible-main" {
provisioner "local-exec" {
  command = <<EOT
        sleep 100;
        > jenkins-ci.ini;
       export ANSIBLE_HOST_KEY_CHECKING=False;
       ansible-playbook  --key=${var.pvt_key} -i jenkins-ci.ini ./ansible/04-Tomcat/web-playbook.yaml -u ubuntu -v
    EOT
}
}
