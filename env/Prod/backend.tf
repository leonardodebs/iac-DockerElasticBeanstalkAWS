terraform {
  backend "s3" {
    bucket = "terraform-state-leonardodebs-16-04-2025"
    key    = "Prod/terraform.tfstate"
    region = "us-west-2"
  }
}
