terraform {
  required_providers {
    null   = { source = "hashicorp/null" }
    random = { source = "hashicorp/random" }
  }
}

locals {
  rev = "1"
}

resource "random_pet" "services" {
  keepers = { rev = local.rev }
}

resource "null_resource" "services" {
  triggers = {
    pet = random_pet.services.id
    rev = local.rev
  }
}
