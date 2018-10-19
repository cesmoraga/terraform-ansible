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
    inline = ["sudo yum install -y python python-simplejson"]

    connection {
      type        = "ssh"
      user        = "cesar_moraga_galdames"
      private_key = "${file("~/.ssh/google_compute_engine")}"
#      agent       = false
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
    #sshKeys = "root:${file("~/.ssh/id_rsa.pub")}"
  }

  network_interface {
    subnetwork = "${google_compute_subnetwork.ovirt_network_subnetwork.name}"

    access_config {
      // Ephemeral IP
    }
  }
 
  provisioner "remote-exec" {
    inline = ["sudo yum install -y python python-simplejson"]

    connection {
      type        = "ssh"
      user        = "cesar_moraga_galdames"
      private_key = "${file("~/.ssh/google_compute_engine")}"
    }
  }

  provisioner "local-exec" {
    command = "ansible-playbook -u root -i '${self.public_ip},' --private-key ${file("~/.ssh/google_compute_engine")} -T 300 playbook.yml" 
  }

}
