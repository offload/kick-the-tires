terraform {
  required_providers {
    null   = { source = "hashicorp/null" }
    random = { source = "hashicorp/random" }
  }
}

locals {
  rev = "1"
}

resource "random_pet" "broken" {
  keepers = { rev = local.rev }
}

resource "null_resource" "broken" {
  triggers = {
    pet = random_pet.broken.id
    rev = local.rev
  }
}

resource "null_resource" "bad" {
  triggers = { value = var.does_not_exist }
}
