resource "google_compute_instance" "applications-vm" {
  name = "applications"

  ## for a setup having multiple instances of the same type, you can do
  ## the following, there would be 2 instances of the same configuration
  ## provisioned
  # count        = 2
  # name         = "${var.instance-name}-${count.index}"
  machine_type = "${var.vm_type["1point7gig"]}"

  zone = "${var.region}"

  tags = [
    "${var.network}-firewall-ssh",
    "${var.network}-firewall-apps",
  ]

  boot_disk {
    initialize_params {
    	image = "${var.os["centos7"]}"
    }
  }

  metadata {
    hostname = "applications-vm"
  }

  network_interface {
    subnetwork = "${google_compute_subnetwork.ovirt_network_subnetwork.name}"

    access_config {
      // Ephemeral IP
    }
  }

  provisioner "remote-exec" {
    inline = [
    	"sudo yum install -y yum-utils device-mapper-persistent-data lvm2 git wget",
    	"sudo sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo",
    	"sudo yum install -y docker-ce",
	"sudo systemctl start docker",
	"git clone https://github.com/cesmoraga/terraform-ansible.git",
	"sudo docker build . -f terraform-ansible/AppBuild/Dockerfile -t hello-world --no-cache",
	"sudo docker run -d -p 3000:3000 -p 4000:4000 hello-world"
	]

    connection {
      type        = "ssh"
      user        = "cesar_moraga_galdames"
      private_key = "${file("~/.ssh/google_compute_engine")}"
    }
  }
}
resource "google_compute_instance" "db-vm" {
  name = "database"

  ## for a setup having multiple instances of the same type, you can do
  ## the following, there would be 2 instances of the same configuration
  ## provisioned
  # count        = 2
  # name         = "${var.instance-name}-${count.index}"
  machine_type = "${var.vm_type["7point5gig"]}"

  zone = "${var.region}"

  tags = [
    "${var.network}-firewall-ssh",
  ]

  boot_disk {
    initialize_params {
    	image = "${var.os["centos7"]}"
    	size  = 20
    }
  }

  metadata {
    hostname = "db-vm"
  }

  network_interface {
    subnetwork = "${google_compute_subnetwork.ovirt_network_subnetwork.name}"

    access_config {
      // Ephemeral IP
    }
  }
 
  provisioner "remote-exec" {
    inline = [
	"sudo yum install -y http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm",
	"sudo yum install -y mysql-community-server wget",
	"sudo systemctl start mysqld",
	"sudo systemctl enable mysqld.service",
	"sudo mysqladmin -u root password ${var.mysql["passwordRoot"]}",
	"echo 'create database test;' | sudo mysql -u root -p${var.mysql["passwordRoot"]} ",
	"wget https://raw.githubusercontent.com/cesmoraga/terraform-ansible/master/dump.sql -O /tmp/dump.sql",
	"sudo mysql -u root -p${var.mysql["passwordRoot"]} test< /tmp/dump.sql",
	"sudo mysql -u root -p${var.mysql["passwordRoot"]} -e \"GRANT ALL ON test.* TO '${var.mysql["userTest"]}'@'${var.mysql["ipfuente"]}' IDENTIFIED BY '${var.mysql["passwordTest"]}';\" "
	
	]

    connection {
      type        = "ssh"
      user        = "cesar_moraga_galdames"
      private_key = "${file("~/.ssh/google_compute_engine")}"
    }
  }

}
