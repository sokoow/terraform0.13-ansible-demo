terraform {
  required_providers {
    scaleway = {
      source  = "scaleway/scaleway"
    }
  }
}

provider "scaleway" {
  region = var.region
  zone = var.zone
}
