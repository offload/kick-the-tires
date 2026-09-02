terraform {
  required_providers {
    null   = { source = "hashicorp/null" }
    random = { source = "hashicorp/random" }
  }
}

locals {
  rev = "1"
}

resource "random_pet" "failapply" {
  keepers = { rev = local.rev }
}

resource "null_resource" "failapply" {
  triggers = {
    pet = random_pet.failapply.id
    rev = local.rev
  }
}

resource "null_resource" "verify" {
  triggers = { rev = local.rev }
  provisioner "local-exec" {
    command = "echo verifying deployment && echo ok"
  }
}
