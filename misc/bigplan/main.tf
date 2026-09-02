terraform {
  required_providers {
    null   = { source = "hashicorp/null" }
    random = { source = "hashicorp/random" }
  }
}

variable "fleet_size" {
  type    = number
  default = 2
}

resource "random_pet" "node" {
  count = var.fleet_size
}

resource "null_resource" "node" {
  count = var.fleet_size
  triggers = { pet = random_pet.node[count.index].id }
}
