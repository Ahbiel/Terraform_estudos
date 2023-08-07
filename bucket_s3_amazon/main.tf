terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.11.0"
    }
  }
}

provider "aws" {
  region = var.availability_zone_names[0]
  default_tags {
    tags = {
      Owner = var.tags_globais
    }
  }
}


