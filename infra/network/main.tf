terraform {
  required_providers {
    null   = { source = "hashicorp/null" }
    random = { source = "hashicorp/random" }
  }
}

locals {
  rev = "8"
}

resource "random_pet" "network" {
  keepers = { rev = local.rev }
}

resource "null_resource" "network" {
  triggers = {
    pet = random_pet.network.id
    rev = local.rev
  }
}
