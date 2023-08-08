terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.11.0"
    }
  }
  backend "s3" {
    bucket = "test-terraform-in-aws-angelo001"
    key    = "aws-vm/terraform.tfstate"
    region = "us-east-1"
  }

}
provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      Owner = "Angelo Gabriel"
    }
  }
}
# buscar informações que há dentro do state do aws vpc
data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "test-terraform-in-aws-angelo001"
    key    = "aws-vpc/terraform.tfstate" # State da vpc criado e armazenado dentro da bucket s3
    region = "us-east-1"
  }
}