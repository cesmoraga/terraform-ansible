resource "google_compute_firewall" "ssh" {
  name    = "${var.network}-firewall-ssh"
  network = "${google_compute_network.ovirt_network.name}"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  target_tags   = ["${var.network}-firewall-ssh"]
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "apps" {
  name    = "${var.network}-firewall-apps"
  network = "${google_compute_network.ovirt_network.name}"

  allow {
    protocol = "tcp"
    ports    = ["3000"]
  }

  target_tags   = ["${var.network}-firewall-apps"]
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "firewall-secure-forward" {
  name    = "${var.network}-firewall-secure-forward"
  network = "${google_compute_network.ovirt_network.name}"

  allow {
    protocol = "tcp"
    ports    = ["24284"]
  }

  target_tags   = ["${var.network}-firewall-secure-forward"]
  source_ranges = ["0.0.0.0/0"]
}
