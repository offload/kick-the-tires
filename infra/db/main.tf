terraform {
  required_providers {
    null   = { source = "hashicorp/null" }
    random = { source = "hashicorp/random" }
  }
}

locals {
  rev = "6"
}

resource "random_pet" "db" {
  keepers = { rev = local.rev }
}

resource "null_resource" "db" {
  triggers = {
    pet = random_pet.db.id
    rev = local.rev
  }
}
