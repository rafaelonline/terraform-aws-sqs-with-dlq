terraform {
  required_version = ">= 0.13.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.60.0, <= 3.69.0"
    }
  }
}