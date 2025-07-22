terraform {
  backend "s3" {
    bucket         = "my-terraform-state-d36f6a8e"
    key            = "lesson-7/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "my-terraform-locks-d36f6a8e"
    encrypt        = true
  }
}
