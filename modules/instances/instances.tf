resource "google_compute_instance" "tf-instance-1" {
  name         = "tf-instance-1"
  machine_type = "e2-standard-2"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"  // Replace with your actual image
    }
  }

  network_interface {
    network    = "tf-vpc-026907"
    subnetwork = "subnet-01"
  }

  metadata_startup_script = <<-EOT
          #!/bin/bash
      EOT

  allow_stopping_for_update = true
}

resource "google_compute_instance" "tf-instance-2" {
  name         = "tf-instance-2"
  machine_type = "e2-standard-2"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"  // Replace with your actual image
    }
  }

  network_interface {
    network    = "tf-vpc-026907"
    subnetwork = "subnet-02"
  }

  metadata_startup_script = <<-EOT
          #!/bin/bash
      EOT

  allow_stopping_for_update = true
}

