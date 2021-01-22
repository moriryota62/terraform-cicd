terraform {
  required_version = ">= 0.13.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.13.0"
    }
  }

  backend "s3" {
    bucket         = "terraform-cicd-delivery-tfstate"
    key            = "environment/terraform.tfstate"
    encrypt        = true
    dynamodb_table = "terraform-cicd-delivery-tfstate-lock"
    region         = "us-east-2"
  }
}

provider "aws" {
  version = ">= 3.5.0"
  region  = "us-east-2"
}