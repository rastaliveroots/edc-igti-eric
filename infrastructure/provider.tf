provider "aws" {
  region = var.aws_region
}

#centralizar o arquivo de controlo do terraform
terraform {
  backend "s3" {
    bucket = "terraform-state-igit-eric"
    key = "C:\data2\iac\terraform.tfstate"
    region = "us-east-2"
  }
}