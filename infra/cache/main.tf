terraform {
  required_providers {
    null   = { source = "hashicorp/null" }
    random = { source = "hashicorp/random" }
  }
}

locals {
  rev = "1"
}

resource "random_pet" "cache" {
  keepers = { rev = local.rev }
}

resource "null_resource" "cache" {
  triggers = {
    pet = random_pet.cache.id
    rev = local.rev
  }
}
