terraform {
  required_providers {
    null   = { source = "hashicorp/null" }
    random = { source = "hashicorp/random" }
  }
}

locals {
  rev = "1"
}

resource "random_pet" "dev_env" {
  keepers = { rev = local.rev }
}

resource "null_resource" "dev_env" {
  triggers = {
    pet = random_pet.dev_env.id
    rev = local.rev
  }
}
