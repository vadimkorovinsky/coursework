terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token     = "${var.yandex_token}"
  folder_id = "${var.yandex_folder_id}"
  zone      = "${var.yandex_zone}"
}

resource "yandex_vpc_network" "network" {
  name = "yandex-network"

  labels = {
    environment = "network"
  }
}

resource "yandex_vpc_subnet" "subnet" {
  name = "yandex-subnet"
  zone = "${var.yandex_zone}"
  network_id = yandex_vpc_network.network.id
  v4_cidr_blocks = ["10.0.0.0/24"]

  labels = {
    environment = "subnet"
  }
}

resource "yandex_compute_instance" "build-machine" {
  name = "build-instance"

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet.id
    nat = true
  }

  resources {
    cores = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      size  = "${var.disk_size}"
      image_id = "${var.boot_disk_image_id}"
      type = "network-ssd"
    }
  }

  metadata = {
    user-data = "${file("userconfig.txt")}"
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Hello, World!'"
    ]
    connection {
      type        = "ssh"
      user        = "user"
      private_key = file("/root/.ssh/id_rsa")
      agent       = false
      host        = self.network_interface[0].nat_ip_address
    }
  }
}
