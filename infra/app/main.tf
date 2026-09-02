terraform {
  required_providers {
    null   = { source = "hashicorp/null" }
    random = { source = "hashicorp/random" }
  }
}

locals {
  rev = "1"
}

resource "random_pet" "app" {
  keepers = { rev = local.rev }
}

resource "null_resource" "app" {
  triggers = {
    pet = random_pet.app.id
    rev = local.rev
  }
}
