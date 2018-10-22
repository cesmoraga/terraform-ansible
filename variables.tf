variable "region" {
  default = "us-west1-a" # Oregon
}

variable "project-name" {
  default = "gausscontrol-219614"
}

variable "subnetwork-region" {
  default = "us-west1"
}

variable "network" {
  default = "ovirt-network"
}

variable "mysql" {
  default = {
  	"passwordRoot"	=  "cmoraga"		
  	"ipfuente"	=  "127.0.0.1"
	"userTest"	=  "cesmoraga"
	"passwordTest"	=  "cmoraga"	
  }
}

variable "vm_type" {
  default {
    "512gig"     = "f1-micro"
    "1point7gig" = "g1-small"
    "7point5gig" = "n1-standard-2"
  }
}

variable "os" {
  default {
    "centos7"         = "centos-7-v20170816"
    "debian9"         = "debian-9-stretch-v20170816"
    "ubuntu-1604-lts" = "ubuntu-1604-xenial-v20170815a"
    "ubuntu-1704"     = "ubuntu-1704-zesty-v20170811"
  }
}

