terraform {
  required_providers {
    null   = { source = "hashicorp/null" }
    random = { source = "hashicorp/random" }
  }
}

locals {
  rev = "10"
}

resource "random_pet" "prod_env" {
  keepers = { rev = local.rev }
}

resource "null_resource" "prod_env" {
  triggers = {
    pet = random_pet.prod_env.id
    rev = local.rev
  }
}
