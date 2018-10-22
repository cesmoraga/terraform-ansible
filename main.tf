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
    	"sudo yum install -y docker git"
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
	"sudo mysql -u root -p${var.mysql["passwordRoot"]} test< /tmp/dump.sql"
	]

    connection {
      type        = "ssh"
      user        = "cesar_moraga_galdames"
      private_key = "${file("~/.ssh/google_compute_engine")}"
    }
  }

}
