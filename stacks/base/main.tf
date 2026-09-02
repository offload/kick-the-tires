terraform {
  required_providers {
    null   = { source = "hashicorp/null" }
    random = { source = "hashicorp/random" }
  }
}

locals {
  rev = "1"
}

resource "random_pet" "base" {
  keepers = { rev = local.rev }
}

resource "null_resource" "base" {
  triggers = {
    pet = random_pet.base.id
    rev = local.rev
  }
}
