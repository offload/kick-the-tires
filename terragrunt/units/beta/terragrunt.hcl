include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../modules/petname"
}

inputs = {
  prefix = "beta-v2"
}
