terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.3.0"
}

provider "aws" {
  region = "us-east-1"
}

module "s3_backend" {
  source              = "./modules/s3-backend"
  bucket_name         = "my-terraform-state-${random_id.suffix.hex}"
  dynamodb_table_name = "my-terraform-locks-${random_id.suffix.hex}"
}

resource "random_id" "suffix" {
  byte_length = 4
}

module "ecr" {
  source = "./modules/ecr"
  name   = "django-app-v2"
}

module "rds" {
  source     = "./modules/rds"
  name       = "django-rds"
  db_name    = "mydb"
  username   = "postgres"
  password   = "postgres12345"
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets
}

module "vpc" {
  source = "./modules/vpc"
}
