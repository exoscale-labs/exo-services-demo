/*
 * @title   Exoscale Demo
 * @author  Taii Shayma
 * @version 1.0
 */

terraform {
  required_providers {
    exoscale = {
      source = "exoscale/exoscale"
      version = "0.40.0"
    }
  }
  backend "s3" {
    bucket = "tfstate-bucket"
    key    = "terraform.tfstate"
    region = "de-fra-1"
    endpoint = "https://sos-de-fra-1.exo.io"
    skip_credentials_validation = true
    skip_region_validation = true
  }

}

provider "exoscale" {
}