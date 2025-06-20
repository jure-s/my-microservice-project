module "s3_backend" {
  source      = "./modules/s3-backend"
  bucket_name = "my-terraform-state-bucket-${random_id.suffix.hex}"
  table_name  = "my-terraform-locks"
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr_block     = "10.0.0.0/16"
  public_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets    = ["10.0.101.0/24", "10.0.102.0/24"]
  availability_zones = ["us-east-1a", "us-east-1b"]
  vpc_name           = "lesson5-vpc"
}

resource "random_id" "suffix" {
  byte_length = 4
}

module "ecr" {
  source           = "./modules/ecr"
  repository_name  = "lesson5-ecr-repo"
}
