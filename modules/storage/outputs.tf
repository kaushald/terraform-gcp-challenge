output "bucket_name" {
  value = google_storage_bucket.tf_bucket.name
}

output "bucket_self_link" {
  value = google_storage_bucket.tf_bucket.self_link
}

output "bucket_url" {
  value = google_storage_bucket.tf_bucket.url
}
