terraform {
  required_providers {
    null   = { source = "hashicorp/null" }
    random = { source = "hashicorp/random" }
  }
}

locals {
  rev = "2"
}

resource "random_pet" "ws" {
  prefix = terraform.workspace
  keepers = { rev = local.rev }
}

resource "null_resource" "ws" {
  triggers = { pet = random_pet.ws.id, workspace = terraform.workspace }
}
