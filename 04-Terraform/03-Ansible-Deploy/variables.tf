variable "key_name" {
  default = "lah1"
}

variable "pvt_key" {
  default = "/root/.ssh/hkey.pem"
}

variable "ami_id"{
  default = "ami-02d0ea44ae3fe9561"
  }

variable "instance_type"{
  default = "t2.micro"
  }

variable "region"{
  default = "us-west-2"
  }

variable "sg-id" {
  default = "sg-00bf8e15b47e23b8d"
}
