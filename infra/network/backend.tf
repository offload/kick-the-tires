terraform {
  backend "s3" {
    bucket                      = "tfstate"
    key                         = "infra/network/terraform.tfstate"
    region                      = "us-east-1"
    endpoints                   = { s3 = "https://sg-demo.tailfa28d.ts.net:8443" }
    use_path_style              = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true
    skip_region_validation      = true
    skip_s3_checksum            = true
  }
}
