terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-jure20250617"
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "my-terraform-locks"
    encrypt        = true
  }
}
