resource "google_compute_instance" "vm_instance" {
  name         = var.name
  machine_type = var.type_machine
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
      network = google_compute_network.vpc_network.name
      access_config {
        nat_ip = "34.29.254.46"
      }
  }

  metadata = {
    ssh-keys = "${var.ssh_user}:${file(var.ssh_pub_key_file)}"
  }
}

data "template_file" "hosts" {
	template = file("./template/hosts.tpl")

	vars = {
		PUBLIC_IP_0 = "${google_compute_instance.vm_instance.network_interface.0.access_config.0.nat_ip}"
	}
}

resource "local_file" "hosts" {
  content = data.template_file.hosts.rendered
  filename = "./hosts"
}

output "ip" {
  value = "${google_compute_instance.vm_instance.network_interface.0.access_config.0.nat_ip}"
}
