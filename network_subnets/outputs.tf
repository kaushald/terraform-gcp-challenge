# modules/network_subnets/outputs.tf

output "subnet_01_self_link" {
  value = google_compute_subnetwork.subnets[0].self_link
}

output "subnet_02_self_link" {
  value = google_compute_subnetwork.subnets[1].self_link
}
