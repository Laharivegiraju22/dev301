terraform {
  backend "local" {
    path = "/tmp/terraform/workspace/terraform.tfstate"
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
