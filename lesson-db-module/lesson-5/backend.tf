terraform {
  backend "s3" {
    bucket         = "myapp-terraform-state-lesson5"
    key            = "lesson-5/terraform.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "myapp-terraform-locks"
    encrypt        = true
  }
}