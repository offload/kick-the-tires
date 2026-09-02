terraform {
  required_providers {
    random = { source = "hashicorp/random" }
  }
}

variable "prefix" {
  type    = string
  default = "unit"
}

resource "random_pet" "this" {
  prefix = var.prefix
}

output "name" {
  value = random_pet.this.id
}
