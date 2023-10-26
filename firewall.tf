resource "google_compute_firewall" "demo_firewall" {
    name = var.name_fw
    network = google_compute_network.vpc_network.name

    allow {
      protocol  = "icmp" 
    }

    allow {
      protocol  = "tcp"
      ports     = var.ports 
    }

    source_ranges = ["0.0.0.0/0"]
    source_tags = ["api-demo"]
}

resource "google_compute_network" "vpc_network" {
    name = "compute-network"
}