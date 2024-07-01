resource "google_storage_bucket" "tf_bucket" {
  name                        = "tf-bucket-372741"
  location                    = var.region
  force_destroy               = true
  uniform_bucket_level_access = true
}
