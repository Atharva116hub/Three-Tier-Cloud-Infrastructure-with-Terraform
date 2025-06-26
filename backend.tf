terraform {
  backend "s3" {
    bucket         = "my-terraform-3tier-bucket"
    key            = "terraform/state"
    region         = "ap-northeast-2"
    dynamodb_table = "terraform-locks"
    encrypt        = true
    
  }
}