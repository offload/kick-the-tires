terraform {
  required_providers {
    null   = { source = "hashicorp/null" }
    random = { source = "hashicorp/random" }
  }
}

locals {
  rev = "14"
}

resource "random_pet" "staging_env" {
  keepers = { rev = local.rev }
}

resource "null_resource" "staging_env" {
  triggers = {
    pet = random_pet.staging_env.id
    rev = local.rev
  }
}
