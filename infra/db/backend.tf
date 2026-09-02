terraform {
  backend "s3" {
    bucket                      = "tfstate"
    key                         = "infra/db/terraform.tfstate"
    region                      = "us-east-1"
    endpoint                    = "https://sg-demo.tailfa28d.ts.net:8443"
    force_path_style            = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true
    skip_region_validation      = true
  }
}
