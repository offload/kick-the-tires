remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    skip_bucket_versioning             = true
    skip_bucket_ssencryption           = true
    skip_bucket_root_access            = true
    skip_bucket_enforced_tls           = true
    skip_bucket_public_access_blocking = true
    disable_bucket_update              = true
    bucket                      = "tfstate"
    key                         = "terragrunt/${path_relative_to_include()}/terraform.tfstate"
    region                      = "us-east-1"
    endpoint                    = "https://sg-demo.tailfa28d.ts.net:8443"
    force_path_style            = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
  }
}
